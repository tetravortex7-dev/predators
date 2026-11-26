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
    phase_end_time?: number;
    target_score?: number;
    escalation_mult?: number;
    announced_bosses?: Record<string, string>;
}

interface EvoFountainPlayerState {
    on_fountain?: boolean;
    base_index?: number;
}

interface EvoDuelStateNetPayload {
    active?: boolean | 0 | 1;
    round_index?: number;
    time_remaining?: number;
    next_duel_in?: number;
    bets_open?: boolean | 0 | 1;
    is_tiebreaker?: boolean | 0 | 1;
    is_boss_duel?: boolean | 0 | 1;
    boss_id?: string;
    challenging_team?: number;
    player_a?: number;
    player_b?: number;
    player_records?: Record<string, { wins?: number; losses?: number }>;
}

interface EvoDuelResultNetPayload {
    round_index?: number;
    winner_id?: number;
    is_draw?: boolean | 0 | 1;
    reason?: string;
    score_reward?: number;
    gold_reward?: number;
    bet_payout?: number;
    expires_at?: number;
}

interface CustomNetTableDeclarations {
    match_state: {
        state: EvoMatchStateNetPayload;
        scores: EvoScoresNetPayload;
        fountains: Record<string, EvoFountainPlayerState>;
    };
    player_evo: Record<string, Record<string, unknown>>;
    spell_shop: Record<string, Record<string, unknown>>;
    shop_draft: Record<string, Record<string, unknown>>;
    duel_state: {
        state: EvoDuelStateNetPayload;
        last_result: EvoDuelResultNetPayload;
    };
    enemy_dossier: Record<string, Record<string, unknown>>;
}
