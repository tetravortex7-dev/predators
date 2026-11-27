export class BaseAbility {}
export interface BaseAbility extends CDOTA_Ability_Lua {}

export class BaseModifier {}
export interface BaseModifier extends CDOTA_Modifier_Lua {}

export class BaseItem {}
export interface BaseItem extends CDOTA_Item_Lua {}

const LUA_G = _G as unknown as Record<string, number>;

type LuaTable = Record<string, unknown>;

function flattenPrototype(proto: object): LuaTable {
    const dst = proto as LuaTable;
    const g = _G as unknown as {
        getmetatable: (this: void, t: unknown) => LuaTable | undefined;
        rawget: (this: void, t: unknown, k: string) => unknown;
    };
    const visited = new Set<LuaTable>();
    let mt = g.getmetatable(proto);
    while (mt !== undefined && !visited.has(mt)) {
        visited.add(mt);
        const indexVal = g.rawget(mt, "__index");
        const base = typeof indexVal === "object" && indexVal !== undefined ? (indexVal as LuaTable) : mt;
        for (const [key, value] of pairs(base)) {
            const k = key as string;
            if (
                k !== "____constructor" &&
                k !== "__index" &&
                k !== "constructor" &&
                g.rawget(dst, k) === undefined
            ) {
                dst[k] = value;
            }
        }
        mt = g.getmetatable(base);
    }
    return dst;
}

export function dotaModifierFunction(name: string): ModifierFunction {
    return LUA_G[name] as ModifierFunction;
}

export function dotaModifierState(name: string): ModifierState {
    return LUA_G[name] as ModifierState;
}

export function registerAbility(name: string) {
    return (ability: { name: string; prototype: object }) => {
        (_G as unknown as Record<string, unknown>)[name] = flattenPrototype(ability.prototype);
    };
}

export function registerModifier(name: string) {
    return (modifier: { name: string; prototype: object }) => {
        (_G as unknown as Record<string, unknown>)[name] = flattenPrototype(modifier.prototype);
    };
}

export function registerItem(name: string) {
    return (item: { name: string; prototype: object }) => {
        (_G as unknown as Record<string, unknown>)[name] = flattenPrototype(item.prototype);
    };
}
