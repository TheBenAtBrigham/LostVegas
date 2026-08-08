/// World-space interaction highlights.

if (room == casino && instance_exists(obj_player) && !dialogue_active) {
    draw_set_alpha(0.75);
	
    draw_set_colour(make_colour_rgb(255, 220, 105));
    if (global.story_stage == 2) draw_circle(100, 96, 8 + sin(current_time / 180) * 2, true);
    if (global.story_stage == 3) draw_circle(520, 108, 8 + sin(current_time / 180) * 2, true);
    if (global.story_stage == 4) draw_rectangle(300, 5, 340, 22, true);
    draw_set_alpha(1);
    draw_set_colour(c_white);

    if (near_prompt != "") {
        draw_set_colour(make_colour_rgb(255, 230, 140));
        draw_text(prompt_x - string_width(near_prompt) * 0.5, prompt_y, near_prompt);
        draw_set_colour(c_white);
    }
}
