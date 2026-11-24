import { EventBus } from "../core/EventBus";

export interface TalentRowDef {
    readonly level: number;
    readonly left: string;
    readonly right: string;
}

export const EVO_TALENT_ROWS: readonly TalentRowDef[] = [
    { level: 10, left: "special_bonus_evo_agi_int_1", right: "special_bonus_evo_int_str_1" },
    { level: 15, left: "special_bonus_evo_hp_100", right: "special_bonus_evo_mana_125" },
    { level: 20, left: "special_bonus_evo_ms_25", right: "special_bonus_evo_armor_6" },
    { level: 25, left: "special_bonus_evo_all_stats_5", right: "special_bonus_evo_magic_resist_15" },
    { level: 30, left: "special_bonus_evo_hp_regen_15", right: "special_bonus_evo_mana_regen_75" },
    { level: 35, left: "special_bonus_evo_damage_75", right: "special_bonus_evo_spell_amp_28" },
];

interface RowPickState {
    left: boolean;
    right: boolean;
}

interface LearnTalentPayload {
    PlayerID: PlayerID;
    row?: number;
    side?: string;
}

export class TalentTreeManager {
    private readonly picksByPlayer: Map<PlayerID, RowPickState[]> = new Map();

    constructor(private readonly eventBus: EventBus) {}

    public init(): void {
        CustomGameEventManager.RegisterListener("evo_learn_talent", (_, event) => {
            this.onLearnTalent(event as unknown as LearnTalentPayload);
        });

        ListenToGameEvent(
            "dota_player_gained_level",
            (event) => {
                if (event.player_id !== undefined && PlayerResource.IsValidPlayerID(event.player_id as PlayerID)) {
                    this.syncPlayer(event.player_id as PlayerID);
                }
            },
            undefined
        );

        ListenToGameEvent(
            "npc_spawned",
            (event) => {
                const ent = EntIndexToHScript(event.entindex);
                if (!ent || ent.IsNull() || !IsValidEntity(ent) || !ent.IsBaseNPC() || !ent.IsRealHero()) return;
                const pid = ent.GetPlayerOwnerID();
                if (PlayerResource.IsValidPlayerID(pid)) {
                    this.syncPlayer(pid);
                }
            },
            undefined
        );

        this.eventBus.on("body_morphed", ({ playerId }) => {
            this.reapplyTalentsToHero(playerId);
            this.syncPlayer(playerId);
        });
    }

    private getOrCreatePicks(playerId: PlayerID): RowPickState[] {
        let picks = this.picksByPlayer.get(playerId);
        if (!picks) {
            picks = EVO_TALENT_ROWS.map(() => ({ left: false, right: false }));
            this.picksByPlayer.set(playerId, picks);
        }
        return picks;
    }

    private onLearnTalent(event: LearnTalentPayload): void {
        const playerId = event.PlayerID;
        if (!PlayerResource.IsValidPlayerID(playerId)) return;

        const row = event.row;
        const side = event.side;
        if (row === undefined || row < 0 || row >= EVO_TALENT_ROWS.length) return;
        if (side !== "left" && side !== "right") return;

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero) || !hero.IsAlive()) return;

        const rowDef = EVO_TALENT_ROWS[row];
        if (hero.GetLevel() < rowDef.level) return;

        const abilityPoints = hero.GetAbilityPoints();
        if (abilityPoints <= 0) return;

        const picks = this.getOrCreatePicks(playerId);
        const rowState = picks[row];
        if (side === "left" && rowState.left) return;
        if (side === "right" && rowState.right) return;
        if ((rowState.left || rowState.right) && hero.GetLevel() < 30) return;

        const abilityName = side === "left" ? rowDef.left : rowDef.right;
        const ability = hero.FindAbilityByName(abilityName) ?? hero.AddAbility(abilityName);
        if (!ability || ability.IsNull()) return;

        hero.SetAbilityPoints(Math.max(0, abilityPoints - 1));
        ability.SetLevel(1);
        hero.CalculateStatBonus(true);

        if (side === "left") {
            rowState.left = true;
        } else {
            rowState.right = true;
        }

        EmitSoundOnClient("General.LevelUp", PlayerResource.GetPlayer(playerId)!);
        this.syncPlayer(playerId);
    }

    private reapplyTalentsToHero(playerId: PlayerID): void {
        const picks = this.picksByPlayer.get(playerId);
        if (!picks) return;
        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) return;

        for (let i = 0; i < EVO_TALENT_ROWS.length; i++) {
            const rowDef = EVO_TALENT_ROWS[i];
            const rowState = picks[i];
            if (rowState.left) {
                const ab = hero.FindAbilityByName(rowDef.left) ?? hero.AddAbility(rowDef.left);
                if (ab && ab.GetLevel() === 0) ab.SetLevel(1);
            }
            if (rowState.right) {
                const ab = hero.FindAbilityByName(rowDef.right) ?? hero.AddAbility(rowDef.right);
                if (ab && ab.GetLevel() === 0) ab.SetLevel(1);
            }
        }
        hero.CalculateStatBonus(true);
    }

    private syncPlayer(playerId: PlayerID): void {
        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        const level = hero && !hero.IsNull() && IsValidEntity(hero) ? hero.GetLevel() : 1;
        const points = hero && !hero.IsNull() && IsValidEntity(hero) ? hero.GetAbilityPoints() : 0;
        const picks = this.getOrCreatePicks(playerId);

        const rowsPayload: Record<string, unknown> = {};
        for (let i = 0; i < EVO_TALENT_ROWS.length; i++) {
            const rowDef = EVO_TALENT_ROWS[i];
            const state = picks[i];
            rowsPayload[tostring(i)] = {
                level: rowDef.level,
                left_ability: rowDef.left,
                right_ability: rowDef.right,
                left_learned: state.left ? 1 : 0,
                right_learned: state.right ? 1 : 0,
            };
        }

        CustomNetTables.SetTableValue(
            "player_talents" as never,
            tostring(playerId),
            {
                hero_level: level,
                ability_points: points,
                rows: rowsPayload,
            } as never
        );
    }
}
