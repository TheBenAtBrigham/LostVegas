/// Advance dialogue first; story interactions pause player movement.
near_prompt = "";
puzzle_target = "";
if (inventory_message_timer > 0) inventory_message_timer -= 1;

// Pause menu owns all gameplay input and is the only place that writes saves.
if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(ord("P"))) {
    pause_open = !pause_open;
    inventory_open = false;
}

if (pause_open) {
    var _pause_count = array_length(pause_options);
    if (keyboard_check_pressed(vk_up)) pause_selected = (pause_selected - 1 + _pause_count) mod _pause_count;
    if (keyboard_check_pressed(vk_down)) pause_selected = (pause_selected + 1) mod _pause_count;

    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        switch (pause_selected) {
            case 0:
                pause_open = false;
                break;
            case 1:
                if (instance_exists(obj_player)) {
                    save_game_state(obj_player.x, obj_player.y, obj_player.direction, room);
                    inventory_message = "GAME SAVED";
                    inventory_message_timer = 180;
                    pause_open = false;
                }
                else {
                    inventory_message = "Saving is unavailable inside a mini-game.";
                    inventory_message_timer = 180;
                }
                break;
            case 2:
                if (load_game_state()) {
                    sync_story_objective();
                    dialogue_active = false;
                    inventory_open = false;
                    pause_open = false;
                    inventory_message = "SAVE LOADED";
                    inventory_message_timer = 180;
                    room_goto(global.target_room);
                }
                else {
                    inventory_message = "NO VALID SAVE FILE";
                    inventory_message_timer = 180;
                }
                break;
            case 3:
                with (obj_minigame_manager) persistent = false;
                persistent = false;
                room_goto(rm_title);
                break;
        }
    }
    exit;
}

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

if (!global.rigging_noticed && obj_minigame_manager.rigged == true && room == casino)
{
	global.rigging_noticed = true;
	start_dialogue(
        ["MARA"],
        [
            "Wait... What's going on? Why was that game harder now?",
            "Are the other games now like this?"
        ]
    );
	
}

if (global.money <= 0 && room == casino)
{
	if (global.slots_bets == 0 && global.spins == 0 && global.roulette_bets == 0 && global.card_bets == 0)
	{
		start_dialogue(
	        ["MARA", "MARA", "MARA", "???", "MARA", "???", "???"],
	        [
	            "Oh, No...",
	            "I lost all my chips!",
				"How will I get out now?!",
				"Tee-hee-hee!!",
				"Who's there?",
				"It's now game over for you!",
				"Though wanna play some more? Here's a chip!"
	        ]
	    );
	global.money = 1;
	//room_goto(rm_title);
	}
	else {
		start_dialogue(
	        ["MARA"],
	        [
	            "I don't have chips...",
				"I'll have to look at the slots or card deck."
	        ]
	    );
	}
	
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

if (!global.game_won && room == rm_outside){
	//global.game_won = true;
	start_dialogue(
        ["MARA"],
        [
            "There's my phone and money!",
			"Better get out of here...!",
			"I made it out!",	
			
        ]
    );
}

if (global.money <= 0)
{
	global.money = 0;
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






//"Game programmed by Henry Ugochukwu, Asa Benson, Freedom Mukanza and Emeribe Stanley Chibuike Ameiz. "
//"Game based on an idea by Asa Benson and Roger the Scorp-Bear is a character created by Asa Benson"