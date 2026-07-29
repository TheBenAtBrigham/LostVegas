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

// Inventory state is initialized separately so older running saves remain valid.
if (!variable_global_exists("inventory")) global.inventory = [];
if (!variable_global_exists("inventory_selected")) global.inventory_selected = 0;

dialogue_lines = [];
dialogue_speakers = [];
dialogue_index = 0;
dialogue_active = false;
inventory_open = false;
inventory_message = "";
inventory_message_timer = 0;
puzzle_target = "";
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

item_name = function(_item_id) {
    switch (_item_id) {
        case "payout_stub": return "VOID PAYOUT STUB";
        case "service_code": return "SERVICE B NOTE";
        case "staff_roster": return "TORN STAFF ROSTER";
        case "maintenance_badge": return "MAINTENANCE BADGE";
    }
    return "UNKNOWN ITEM";
};

item_description = function(_item_id) {
    switch (_item_id) {
        case "payout_stub": return "A slot receipt marked VOID. The cashier may know why.";
        case "service_code": return "A carbon copy linking Service B to night code 0413.";
        case "staff_roster": return "Closing staff use a hidden corridor instead of the casino floor.";
        case "maintenance_badge": return "A green access badge for maintenance doors.";
    }
    return "It has no obvious use.";
};

inventory_has = function(_item_id) {
    for (var _i = 0; _i < array_length(global.inventory); _i++) {
        if (global.inventory[_i] == _item_id) return true;
    }
    return false;
};

inventory_add = function(_item_id) {
    if (inventory_has(_item_id)) return false;
    array_push(global.inventory, _item_id);
    global.inventory_selected = array_length(global.inventory) - 1;
    inventory_message = "COLLECTED: " + item_name(_item_id);
    inventory_message_timer = 180;
    return true;
};

inventory_remove = function(_item_id) {
    var _new_inventory = [];
    for (var _i = 0; _i < array_length(global.inventory); _i++) {
        if (global.inventory[_i] != _item_id) array_push(_new_inventory, global.inventory[_i]);
    }
    global.inventory = _new_inventory;
    global.inventory_selected = clamp(global.inventory_selected, 0, max(0, array_length(global.inventory) - 1));
};

inventory_selected_item = function() {
    if (array_length(global.inventory) <= 0) return "";
    global.inventory_selected = clamp(global.inventory_selected, 0, array_length(global.inventory) - 1);
    return global.inventory[global.inventory_selected];
};

inventory_fail = function(_message) {
    inventory_message = _message;
    inventory_message_timer = 150;
};

inventory_use = function(_target) {
    var _item_id = inventory_selected_item();
    if (_item_id == "") {
        inventory_fail("Your inventory is empty.");
        return false;
    }

    if (_target == "cashier" && _item_id == "payout_stub") {
        inventory_remove("payout_stub");
        inventory_add("service_code");
        global.found_cashier_clue = true;
        global.story_stage = 3;
        objective_text = "Use the Service B note at the BAR counter.";
        inventory_open = false;
        start_dialogue(
            ["MARA"],
            [
                "The stub matches a carbon copy: 'VOID PAYOUT / send to Service B / night code 0413.'",
                "The cashier keeps my stub. The carbon copy smells like citrus and bar polish.",
                "Service B must be behind the bar."
            ]
        );
        return true;
    }

    if (_target == "bar" && _item_id == "service_code") {
        inventory_add("maintenance_badge");
        global.found_service_badge = true;
        global.story_stage = 4;
        objective_text = "Select the maintenance badge and use it at the north EXIT.";
        inventory_open = false;
        start_dialogue(
            ["MARA", "INTERCOM", "MARA"],
            [
                "Code 0413 opens the service drawer. Inside: a maintenance badge and a map marked 'STAIRS--NO CAMERAS.'",
                "Please return casino property to the nearest attendant.",
                "The games were the distraction. The staff route is the way out."
            ]
        );
        return true;
    }

    if (_target == "exit" && _item_id == "maintenance_badge") {
        inventory_remove("maintenance_badge");
        global.story_stage = 5;
        global.escape_open = false;
        objective_text = "Escape route opened: maintenance stairs.";
        inventory_open = false;
        start_dialogue(
            ["MARA"],
            [
                "The reader takes the badge. Its light turns green.",
                "Beyond the door, cold concrete stairs lead down--away from the music.",
                "I haven't escaped the Golden Ace yet. But now I'm finally playing my own game."
            ]
        );
        return true;
    }

    if (_target == "") inventory_fail("There is nothing here to use that on.");
    else inventory_fail(item_name(_item_id) + " does not work here.");
    return false;
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


