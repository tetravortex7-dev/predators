import { EventBus } from "../core/EventBus";
import { LevelingManager } from "../core/LevelingManager";
import { EVO_CONSTANTS } from "../data/game_constants";
import { HeroAppearance } from "../lib/HeroAppearance";

export class DevCheats {
    private devFowDisabled = false;

    constructor(
        private readonly eventBus: EventBus,
        private readonly levelingManager: LevelingManager
    ) {}

    public init(): void {
        ListenToGameEvent("player_chat", (event) => this.onPlayerChat(event), undefined);
    }

    private onPlayerChat(event: GameEventProvidedProperties & PlayerChatEvent): void {
        if (!IsInToolsMode() && !GameRules.IsCheatMode()) {
            return;
        }

        const text = (event.text ?? "").trim();
        const isPlusLevel = text === "+" || (text.startsWith("+") && tonumber(text.slice(1).trim()) !== undefined);
        if (!isPlusLevel && !text.startsWith("-evo_")) {
            return;
        }

        const playerId = event.playerid as PlayerID;
        if (!PlayerResource.IsValidPlayerID(playerId)) {
            return;
        }

        const hero = PlayerResource.GetSelectedHeroEntity(playerId);
        if (!hero || hero.IsNull() || !IsValidEntity(hero)) {
            return;
        }

        if (isPlusLevel) {
            const count = text === "+" ? 1 : tonumber(text.slice(1).trim()) ?? 1;
            this.levelUpHero(hero, count);
            return;
        }

        const parts = text.split(" ").filter((token) => token.length > 0);
        const command = parts[0].toLowerCase();
        const args = parts.slice(1);

        switch (command) {
            case "-evo_gold": {
                const amount = tonumber(args[0]) ?? 1000;
                hero.ModifyGold(amount, true, ModifyGoldReason.CHEAT_COMMAND);
                this.say(`[Dev] +${amount} gold`);
                break;
            }
            case "-evo_lvl": {
                this.levelUpHero(hero, tonumber(args[0]) ?? 1);
                break;
            }
            case "-evo_fortify": {
                const count = Math.max(1, tonumber(args[0]) ?? 1);
                this.levelingManager.grantFortificationCharge(playerId, count, hero.GetLevel());
                const total = this.levelingManager.getFortificationCharges(playerId);
                this.say(`[Dev] +${count} fortification charge(s) (total: ${total})`);
                break;
            }
            case "-evo_look": {
                this.handleLookCommand(playerId, hero, args);
                break;
            }
            case "-evo_fow": {
                const mode = (args[0] ?? "").toLowerCase();
                this.devFowDisabled = mode === "off" ? true : mode === "on" ? false : !this.devFowDisabled;
                const gm = GameRules.GetGameModeEntity();
                gm.SetFogOfWarDisabled(this.devFowDisabled);
                gm.SetUnseenFogOfWarEnabled(!this.devFowDisabled);
                this.say(`[Dev] FOW ${this.devFowDisabled ? "DISABLED" : "ENABLED"}`);
                break;
            }
            case "-evo_evo":
            case "-evo_morph":
            case "-evo_duel":
            case "-evo_boss":
            case "-evo_score":
            case "-evo_tp":
            case "-evo_mut": {
                this.eventBus.emit("dev_command", { playerId, command, args });
                this.say(`[Dev] Dispatched ${command} ${args.join(" ")}`);
                break;
            }
            default: {
                this.say(`[Dev] Unknown command: ${command}`);
                break;
            }
        }
    }

    private handleLookCommand(playerId: PlayerID, hero: CDOTA_BaseNPC_Hero, args: string[]): void {
        const sub = (args[0] ?? "morph").toLowerCase();
        if (sub === "morph") {
            HeroAppearance.replaceHeroPreservingState(playerId, "npc_dota_hero_morphling", {
                appearance: {
                    scale: 1.35,
                    color: [90, 240, 200],
                    hideBaseWearables: true,
                    displayName: "APEX MORPHLING",
                    wearables: [
                        {
                            model: "models/items/morphling/crown_of_tears/mesh/crown_of_tears_model.vmdl",
                            particles: [
                                "particles/econ/items/morphling/morphling_crown_of_tears/morphling_crown_ambient.vpcf",
                            ],
                        },
                        {
                            model: "models/items/morphling/ethereal_blade/ethereal_blade.vmdl",
                            particles: [
                                "particles/econ/items/morphling/morphling_ethereal/morphling_ethereal_ambient.vpcf",
                            ],
                        },
                        {
                            model: "models/items/morphling/abyss_overlord_shoulder/abyss_overlord_shoulder.vmdl",
                            particles: [
                                "particles/econ/items/morphling/morph_abyss_overlord/morph_abyss_shoulder_ambient.vpcf",
                            ],
                        },
                        {
                            model: "models/items/morphling/abyss_overlord_back/abyss_overlord_back.vmdl",
                            particles: [
                                "particles/econ/items/morphling/morph_abyss_overlord/morph_abyss_back_ambient.vpcf",
                            ],
                        },
                    ],
                },
            });
            this.say("[Dev] Switched to native Morphling + Apex appearance preset.");
            return;
        }

        if (sub === "hero") {
            const rawName = (args[1] ?? "morphling").toLowerCase();
            const heroClass = rawName.startsWith("npc_dota_hero_") ? rawName : `npc_dota_hero_${rawName}`;
            const replaced = HeroAppearance.replaceHeroPreservingState(playerId, heroClass);
            if (replaced) {
                this.say(`[Dev] Replaced hero with ${heroClass}`);
            }
            return;
        }

        if (sub === "color") {
            const r = tonumber(args[1]) ?? 255;
            const g = tonumber(args[2]) ?? 255;
            const b = tonumber(args[3]) ?? 255;
            const a = args[4] !== undefined ? tonumber(args[4]) : undefined;
            HeroAppearance.setColor(hero, r, g, b, a);
            this.say(`[Dev] Hero color set to (${r}, ${g}, ${b})`);
            return;
        }

        if (sub === "scale") {
            const scale = tonumber(args[1]) ?? 1.0;
            HeroAppearance.setScale(hero, scale);
            this.say(`[Dev] Hero scale set to ${scale}`);
            return;
        }

        if (sub === "name") {
            const displayName = args.slice(1).join(" ").trim();
            if (displayName.length > 0) {
                HeroAppearance.setDisplayName(hero, displayName);
                this.say(`[Dev] Hero display name set to ${displayName}`);
            }
            return;
        }

        if (sub === "reset") {
            HeroAppearance.clearCustomWearables(hero);
            HeroAppearance.restoreBaseWearables(hero);
            HeroAppearance.resetColor(hero);
            HeroAppearance.setScale(hero, 1.0);
            this.say("[Dev] Hero appearance reset.");
        }
    }

    private levelUpHero(hero: CDOTA_BaseNPC_Hero, rawLevels: number): void {
        const levels = Math.max(1, Math.min(EVO_CONSTANTS.MAX_HERO_LEVEL, rawLevels));
        for (let i = 0; i < levels; i++) {
            if (hero.GetLevel() >= EVO_CONSTANTS.MAX_HERO_LEVEL) break;
            hero.HeroLevelUp(true);
        }
        this.say(`[Dev] Hero level is now ${hero.GetLevel()}`);
    }

    private say(message: string): void {
        GameRules.SendCustomMessage(message, 0, 0);
    }
}
