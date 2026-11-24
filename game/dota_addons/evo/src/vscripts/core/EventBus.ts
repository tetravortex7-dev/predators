export type EvoMatchPhase = "INCUBATOR" | "SURFACE" | "TIEBREAKER" | "ENDED";

export interface EvoEventMap {
    phase_changed: {
        previousPhase: EvoMatchPhase;
        newPhase: EvoMatchPhase;
        elapsedTime: number;
    };
    match_ended: {
        winnerTeam: DotaTeam;
        reason: "score_limit" | "time_limit" | "tiebreaker";
    };
    hero_leveled_up: {
        playerId: PlayerID;
        hero: CDOTA_BaseNPC_Hero;
        newLevel: number;
    };
    fortification_charge_granted: {
        playerId: PlayerID;
        level: number;
        totalCharges: number;
    };
    evo_points_changed: {
        playerId: PlayerID;
        previousPoints: number;
        newPoints: number;
        delta: number;
    };
    body_morphed: {
        playerId: PlayerID;
        previousBodyId: string;
        newBodyId: string;
        tierIndex: number;
    };
    mutation_applied: {
        playerId: PlayerID;
        slotIndex: number;
        mutationId: string;
    };
    spell_purchased: {
        playerId: PlayerID;
        abilityName: string;
    };
    phase_tier_unlocked: {
        tierIndex: number;
        elapsedTime: number;
    };
    biomass_collected: {
        playerId: PlayerID;
        amount: number;
    };
    team_score_changed: {
        team: DotaTeam;
        delta: number;
        newScore: number;
        reason: string;
    };
    boss_event: {
        bossId: string;
        level: number;
        event: "announced" | "spawned" | "courage" | "killed";
        killerTeam?: DotaTeam;
        killerPlayerId?: PlayerID;
    };
    boss_core_destroyed: {
        playerId: PlayerID;
        team: DotaTeam;
        bonusScore: number;
    };
    tiebreaker_requested: {
        tiedTeams: DotaTeam[];
    };
    duel_started: {
        roundIndex: number;
        isTiebreaker: boolean;
    };
    duel_finished: {
        roundIndex: number;
        winnerId: PlayerID | undefined;
        loserId: PlayerID | undefined;
        isTiebreaker: boolean;
    };
    dev_command: {
        playerId: PlayerID;
        command: string;
        args: string[];
    };
}

export type EvoEventName = keyof EvoEventMap;
export type EvoEventHandler<K extends EvoEventName> = (payload: EvoEventMap[K]) => void;

export class EventBus {
    private listeners: Map<EvoEventName, Array<EvoEventHandler<EvoEventName>>> = new Map();

    public on<K extends EvoEventName>(event: K, handler: EvoEventHandler<K>): () => void {
        let list = this.listeners.get(event);
        if (!list) {
            list = [];
            this.listeners.set(event, list);
        }
        list.push(handler as EvoEventHandler<EvoEventName>);

        return () => this.off(event, handler);
    }

    public once<K extends EvoEventName>(event: K, handler: EvoEventHandler<K>): () => void {
        const wrapper: EvoEventHandler<K> = (payload) => {
            this.off(event, wrapper);
            handler(payload);
        };
        return this.on(event, wrapper);
    }

    public off<K extends EvoEventName>(event: K, handler: EvoEventHandler<K>): void {
        const list = this.listeners.get(event);
        if (!list) return;

        const index = list.indexOf(handler as EvoEventHandler<EvoEventName>);
        if (index !== -1) {
            list.splice(index, 1);
        }
    }

    public emit<K extends EvoEventName>(event: K, payload: EvoEventMap[K]): void {
        const list = this.listeners.get(event);
        if (!list || list.length === 0) return;

        const snapshot = [...list];
        for (const handler of snapshot) {
            handler(payload);
        }
    }

    public clear(): void {
        this.listeners.clear();
    }
}
