/// FILE: obj_jim / Create event
/// Simple self-contained dialogue — no separate manager object needed.
/// Uses the REAL state variables from obj_game_manager (global.story_stage,
/// global.money, global.found_*_clue flags) — not a placeholder enum.

interact_range = 32;
in_range = false;
talking = false;
line_index = 0;
lines = [];

npc_name = "Jim";

/// Picks Jim's dialogue based on current story_stage and clue flags.
/// Called fresh each time a conversation starts, so it's always current.
get_dialogue_lines = function() {
    if (global.escape_open) {
        return ["...", "Go on, then. Get out while you can."];
    }

    if (global.found_service_badge || global.found_cashier_clue || global.found_planter_note) {
        return [
            "You've been poking around more than most.",
            "Careful. Curiosity doesn't pay out here."
        ];
    }

    if (global.minigames_played >= 3) {
        return [
            "Tough luck out there, huh?",
            "The house always wins here. That's just how it goes."
        ];
    }

    return [
        "Welcome to the Golden Ace.",
        "Play a few games — win your way out, if you can."
    ];
};
