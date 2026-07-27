/// FILE: obj_slotmachine / Step event (v2 — reports outcome to the story system)
/// PASTE ONLY INTO: obj_slotmachine -> Step event tab
/// Replaces the earlier version. Only addition: story_report_minigame_result(_won)
/// is called right after a spin resolves.

in_range = (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) <= interact_range);

if (in_range && !spinning && keyboard_check_pressed(vk_space)) {
    spinning = true;
    spin_timer = 0;
    result_text = "";
}

if (spinning) {
    spin_timer++;
    if (spin_timer >= spin_duration) {
        spinning = false;

        var _won = (random(1) < win_chance);
        if (_won) {
            result_text = "WIN!";
            global.player_credits += 50;
        } else {
            result_text = "LOSE";
        }

        win_chance = max(min_win_chance, win_chance - win_chance_decay);

        // Tell the story system what happened — this is what drives progression.
        story_report_minigame_result(_won);
    }
}
