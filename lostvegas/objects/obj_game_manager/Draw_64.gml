/// Draw GUI: persistent objective and dialogue presentation.
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

// Objective ribbon.
draw_set_alpha(0.88);
draw_set_colour(make_colour_rgb(13, 9, 21));
draw_rectangle(18, 18, min(_gw - 18, 690), 72, false);
draw_set_alpha(1);
draw_set_colour(make_colour_rgb(220, 171, 64));
draw_rectangle(18, 18, min(_gw - 18, 690), 72, true);
draw_text(34, 28, "ESCAPE LEAD");
draw_set_colour(c_white);
draw_text(34, 48, objective_text);

if (dialogue_active && array_length(dialogue_lines) > 0) {
    var _left = 54;
    var _right = _gw - 54;
    var _top = _gh - 188;
    var _bottom = _gh - 36;

    draw_set_alpha(0.94);
    draw_set_colour(make_colour_rgb(12, 8, 18));
    draw_rectangle(_left, _top, _right, _bottom, false);
    draw_set_alpha(1);
    draw_set_colour(make_colour_rgb(220, 171, 64));
    draw_rectangle(_left, _top, _right, _bottom, true);
    draw_text(_left + 24, _top + 18, dialogue_speakers[dialogue_index]);
    draw_set_colour(c_white);
    draw_text_ext(_left + 24, _top + 50, dialogue_lines[dialogue_index], 8, _right - _left - 48);
    draw_set_colour(make_colour_rgb(180, 166, 190));
    draw_text(_right - 245, _bottom - 26, "SPACE / E / ENTER  Continue");
}

draw_set_alpha(1);
draw_set_colour(c_white);
