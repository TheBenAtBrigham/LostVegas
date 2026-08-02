/// FILE: obj_jim / Step event

in_range = (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) <= interact_range);

if (!talking) {
    if (in_range && keyboard_check_pressed(vk_space)) {
        talking = true;
        line_index = 0;
        lines = get_dialogue_lines(); // re-evaluated fresh each time, so it reflects current story_stage/clues
    }
} else {
    if (keyboard_check_pressed(vk_space)) {
        line_index++;
        if (line_index >= array_length(lines)) {
            talking = false;
        }
    }
}
