/// Advance dialogue first; story interactions pause player movement.
near_prompt = "";

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
if (global.minigames_played > 0 && global.story_stage < 2) {
    global.story_stage = 2;
    start_dialogue(
        ["MARA", "JIM"],
        [
            "The reels stopped, but the receipt printer kept going. It printed a staff code beneath my payout.",
            "They count every chip at the cashier. But people? People vanish between shifts.",
            "The cashier desk may have kept the other half of this trail."
        ]
    );
    objective_text = "Search the CASHIER desk for the payout trail.";
}

// Optional exploration beat: a clue unrelated to money.
if (!global.found_planter_note && point_distance(_px, _py, 582, 306) < 34) {
    global.found_planter_note = true;
    start_dialogue(
        ["MARA"],
        [
            "A torn staff roster is tucked under the planter: 'Closing crew: use service corridor. Never cross the floor.'",
            "The casino advertises exits everywhere. The useful routes are the ones it doesn't advertise."
        ]
    );
}

// Required clue one: cashier paperwork.
if (global.story_stage == 2 && _px < 190 && _py < 112) {
    near_prompt = "E / SPACE  Search the cashier desk";
    prompt_x = 100;
    prompt_y = 102;
    if (_interact) {
        global.found_cashier_clue = true;
        global.story_stage = 3;
        objective_text = "Follow the staff route to the BAR service counter.";
        start_dialogue(
            ["MARA"],
            [
                "A carbon copy: 'VOID PAYOUT / send to Service B / night code 0413.'",
                "Not a jackpot. A work order. The paper smells like citrus and bar polish.",
                "Service B must be behind the bar."
            ]
        );
    }
}

// Required clue two: the mundane service route contains the real escape tool.
if (global.story_stage == 3 && _px > 430 && _py < 122) {
    near_prompt = "E / SPACE  Enter code 0413";
    prompt_x = 520;
    prompt_y = 112;
    if (_interact) {
        global.found_service_badge = true;
        global.escape_open = true;
        global.story_stage = 4;
        objective_text = "Use the service badge at the north EXIT.";
        start_dialogue(
            ["MARA", "INTERCOM"],
            [
                "The service drawer clicks open. Inside: a green maintenance badge and a map marked 'STAIRS--NO CAMERAS.'",
                "Please return casino property to the nearest attendant.",
                "No. The games were the distraction. The staff route is the way out."
            ]
        );
    }
}

// First escape-path payoff.
if (global.escape_open && _py < 48 && _px > 282 && _px < 358) {
    global.story_stage = 5;
    objective_text = "Escape route opened: maintenance stairs.";
    start_dialogue(
        ["MARA"],
        [
            "The badge light turns green. Beyond the door, cold concrete stairs lead down--away from the music.",
            "I haven't escaped the Golden Ace yet. But now I'm finally playing my own game."
        ]
    );
    global.escape_open = false;
}
