/// Persistent story and escape-state controller.
if (instance_number(obj_game_manager) > 1) {
    instance_destroy();
    exit;
}

if (!variable_global_exists("story_initialized")) {
    global.story_initialized = true;
    global.money = 50;
    global.story_stage = 0;
    global.minigames_played = 0;
    global.minigame_session_counted = false;
    global.saw_locked_exit = false;
    global.found_planter_note = false;
    global.found_cashier_clue = false;
    global.found_service_badge = false;
    global.escape_open = false;
}

dialogue_lines = [];
dialogue_speakers = [];
dialogue_index = 0;
dialogue_active = false;
objective_text = "Listen.";
near_prompt = "";
prompt_x = 0;
prompt_y = 0;

start_dialogue = function(_speakers, _lines) {
    dialogue_speakers = _speakers;
    dialogue_lines = _lines;
    dialogue_index = 0;
    dialogue_active = true;
};

start_dialogue(
    ["???", "MARA", "INTERCOM", "MARA"],
    [
        "Wake up. The carpet is moving... no, that's just the lights.",
        "My wallet, my phone--gone. All I have is a fifty-dollar chip.",
        "Welcome back to the Golden Ace. Remember: every guest leaves a winner.",
        "Then why are the front doors chained?"
    ]
);


