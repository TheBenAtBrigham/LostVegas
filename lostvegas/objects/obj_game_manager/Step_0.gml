/// Advance dialogue first; story interactions pause player movement.
near_prompt = "";
puzzle_target = "";
if (inventory_message_timer > 0) inventory_message_timer -= 1;

if (dialogue_active) {
    if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_enter)) {
        dialogue_index += 1;
        if (dialogue_index >= array_length(dialogue_lines)) {
            dialogue_active = false;
            if (global.story_stage == 0) {
                global.story_stage = 1;
                objective_text = "Inspect the locked EXIT at the north wall.";
            }
        }
    }
    exit;
}

// Inventory persists and can be inspected from either the casino or mini-game.
if (keyboard_check_pressed(ord("I"))) inventory_open = !inventory_open;

if (inventory_open) {
    var _count = array_length(global.inventory);
    if (_count > 0) {
        if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_up)) {
            global.inventory_selected = (global.inventory_selected - 1 + _count) mod _count;
        }
        if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_down)) {
            global.inventory_selected = (global.inventory_selected + 1) mod _count;
        }
    }
}

if (room != casino || !instance_exists(obj_player)) exit;

var _px = obj_player.x;
var _py = obj_player.y;
var _interact = keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"));

// Exploration trigger: the obvious way out establishes the central problem.
if (!global.saw_locked_exit && _py < 72 && _px > 276 && _px < 364) {
    global.saw_locked_exit = true;
    start_dialogue(
        ["MARA", "INTERCOM", "MARA"],
        [
            "No handle. A badge reader--and the cable disappears behind the wall.",
            "The tables are open, valued guest. Your luck is waiting.",
            "It wants me looking at the games, not at the building. Fine. One game, then I watch what the house does."
        ]
    );
    objective_text = "Play any casino game and watch what happens.";
}

// Mini-game progress is reported by the persistent mini-game manager on return.
if (global.slots_played == true && global.minigames_played > 0 && global.story_stage < 2) {
    global.story_stage = 2;
    inventory_add("payout_stub");
    start_dialogue(
        ["MARA", "JIM"],
        [
            "The reels stopped, but the receipt printer kept going. It printed a staff code beneath my payout.",
            "They count every chip at the cashier. But people? People vanish between shifts.",
            "The cashier desk may have kept the other half of this trail."
        ]
    );
    objective_text = "Take the payout stub to the CASHIER desk.";
}

// Optional exploration beat: a clue unrelated to money.
if (!global.found_planter_note && point_distance(_px, _py, 582, 306) < 34) {
    global.found_planter_note = true;
    inventory_add("staff_roster");
    start_dialogue(
        ["MARA"],
        [
            "A torn staff roster is tucked under the planter: 'Closing crew: use service corridor. Never cross the floor.'",
            "The casino advertises exits everywhere. The useful routes are the ones it doesn't advertise."
        ]
    );
}

// Identify the current puzzle target before processing inventory use.
if (global.story_stage == 2 && _px < 190 && _py < 112) {
    puzzle_target = "cashier";
    near_prompt = "I: Inventory   Select PAYOUT STUB   E: Use";
    prompt_x = 100;
    prompt_y = 102;
}

if (global.story_stage == 3 && _px > 430 && _py < 122) {
    puzzle_target = "bar";
    near_prompt = "I: Inventory   Select SERVICE B NOTE   E: Use";
    prompt_x = 520;
    prompt_y = 112;
}

if (global.story_stage == 4 && _py < 62 && _px > 276 && _px < 364) {
    puzzle_target = "exit";
    near_prompt = "I: Inventory   Select MAINTENANCE BADGE   E: Use";
    prompt_x = 320;
    prompt_y = 54;
}

// E uses the selected item on the nearby puzzle object. Inventory may stay open.
if (keyboard_check_pressed(ord("E"))) {
    inventory_use(puzzle_target);
}

// Space gives guidance but never silently uses an item.
if (keyboard_check_pressed(vk_space) && puzzle_target != "" && !inventory_open) {
    inventory_fail("Open inventory with I, select an item, then press E to use it.");
}

