/// FILE: obj_jim / Draw event

draw_self();

if (in_range && !talking) {
    draw_text(x - 30, y - 40, "Press SPACE to talk");
}

if (talking) {
    var _box_x = 60;
    var _box_y = 260;
    var _box_w = 520;
    var _box_h = 90;

    draw_set_alpha(0.9);
    draw_set_colour(make_colour_rgb(12, 8, 18));
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, false);
    draw_set_alpha(1);
    draw_set_colour(make_colour_rgb(218, 170, 62));
    draw_rectangle(_box_x, _box_y, _box_x + _box_w, _box_y + _box_h, true);

    draw_set_colour(make_colour_rgb(218, 170, 62));
    draw_text(_box_x + 12, _box_y - 18, npc_name);

    draw_set_colour(c_white);
    draw_text(_box_x + 16, _box_y + 16, lines[line_index]);

    draw_set_colour(make_colour_rgb(160, 160, 160));
    draw_text(_box_x + 16, _box_y + _box_h - 20, "[SPACE to continue]");
}
