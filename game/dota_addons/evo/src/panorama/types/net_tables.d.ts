interface EvoTeamScoreEntry {
    team_id: number;
    score: number;
    comeback_mult: number;
    players?: Record<string, number>;
}

interface EvoScoresNetPayload {
    target_score?: number;
    escalation_mult?: number;
    teams?: Record<string, EvoTeamScoreEntry>;
    player_scores?: Record<string, number>;
}

interface EvoMatchStateNetPayload {
    phase?: string;
    elapsed_time?: number;
    target_score?: number;
    escalation_mult?: number;
    announced_bosses?: Record<string, string>;
}

interface CustomNetTableDeclarations {
    match_state: {
        state: EvoMatchStateNetPayload;
        scores: EvoScoresNetPayload;
    };
    player_evo: Record<string, Record<string, unknown>>;
    spell_shop: Record<string, Record<string, unknown>>;
    shop_draft: Record<string, Record<string, unknown>>;
    duel_state: {
        state: Record<string, unknown>;
    };
    enemy_dossier: Record<string, Record<string, unknown>>;
}
