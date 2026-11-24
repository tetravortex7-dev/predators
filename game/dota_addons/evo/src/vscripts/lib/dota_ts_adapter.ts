export class BaseAbility {}
export interface BaseAbility extends CDOTA_Ability_Lua {}

export class BaseModifier {}
export interface BaseModifier extends CDOTA_Modifier_Lua {}

export class BaseItem {}
export interface BaseItem extends CDOTA_Item_Lua {}

const LUA_G = _G as unknown as Record<string, number>;

export function dotaModifierFunction(name: string): ModifierFunction {
    return LUA_G[name] as ModifierFunction;
}

export function dotaModifierState(name: string): ModifierState {
    return LUA_G[name] as ModifierState;
}

export function registerAbility(name: string) {
    return (ability: { name: string; prototype: object }) => {
        (_G as unknown as Record<string, unknown>)[name] = ability.prototype;
    };
}

export function registerModifier(name: string) {
    return (modifier: { name: string; prototype: object }) => {
        (_G as unknown as Record<string, unknown>)[name] = modifier.prototype;
    };
}

export function registerItem(name: string) {
    return (item: { name: string; prototype: object }) => {
        (_G as unknown as Record<string, unknown>)[name] = item.prototype;
    };
}
