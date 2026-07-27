/// FILE: scripts/story_state (REPLACES the earlier switch-statement version)
/// A data-driven story system: each beat is defined once, with its own
/// unlock condition and effect, instead of being buried in a switch
/// statement. Adding a new story beat later means adding one entry to
/// the array below — nothing else in the codebase needs to change.

enum StoryState {
    TRAPPED,
    SUSPICIOUS,
    CLUE_FOUND,
    EXIT_UNLOCKED
}

/// Call once — e.g. in obj_casino_room's Create event.
function story_init() {
    if (variable_global_exists("story_state")) exit; // already initialized

    global.story_state   = StoryState.TRAPPED;
    global.total_losses  = 0;
    global.player_credits = 0;
    global.story_log      = []; // human-readable history, for debugging/testing

    // --- Story beats: each one checks a condition against current global
    // state, and if true, transitions to a new state and logs why. ---
    global.story_beats = [
        {
            from_state : StoryState.TRAPPED,
            to_state   : StoryState.SUSPICIOUS,
            condition  : function() { return global.total_losses >= 3; },
            log_text   : "Losses hit 3 — player is now SUSPICIOUS"
        },
        {
            from_state : StoryState.SUSPICIOUS,
            to_state   : StoryState.CLUE_FOUND,
            condition  : function() { return global.total_losses >= 6; },
            log_text   : "Losses hit 6 — CLUE_FOUND"
        },
        {
            from_state : StoryState.CLUE_FOUND,
            to_state   : StoryState.EXIT_UNLOCKED,
            condition  : function() { return true; }, // next resolved minigame — placeholder trigger
            log_text   : "Clue used — EXIT_UNLOCKED"
        }
    ];

    story_log_add("Story initialized — state: TRAPPED");
}

/// Adds a line to the story log with a timestamp (in game steps), capped
/// to the last 20 entries so it doesn't grow forever during a long session.
function story_log_add(_text) {
    array_push(global.story_log, string(current_time) + " — " + _text);
    if (array_length(global.story_log) > 20) {
        array_delete(global.story_log, 0, 1);
    }
}

/// Call this whenever a minigame resolves, passing whether the player won.
/// This checks all story beats whose from_state matches the current state,
/// in order, and applies the first one whose condition is met.
function story_report_minigame_result(_won) {
    if (!_won) {
        global.total_losses++;
    }

    for (var _i = 0; _i < array_length(global.story_beats); _i++) {
        var _beat = global.story_beats[_i];
        if (_beat.from_state == global.story_state && _beat.condition()) {
            global.story_state = _beat.to_state;
            story_log_add(_beat.log_text);
            break; // only ever advance one beat per reported result
        }
    }
}

/// Human-readable name for the current state — used by any HUD/debug text.
function story_state_name() {
    switch (global.story_state) {
        case StoryState.TRAPPED:       return "TRAPPED";
        case StoryState.SUSPICIOUS:    return "SUSPICIOUS";
        case StoryState.CLUE_FOUND:    return "CLUE_FOUND";
        case StoryState.EXIT_UNLOCKED: return "EXIT_UNLOCKED";
    }
    return "UNKNOWN";
}
