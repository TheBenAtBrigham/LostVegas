/// Draw GUI: persistent objective and dialogue presentation.
var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

// Mini-game rooms need their own presentation and controls.
if (room == rm_slots) {
    draw_set_alpha(0.92);
    draw_set_colour(make_colour_rgb(13, 9, 21));
    draw_rectangle(18, 18, min(_gw - 18, 760), 94, false);
    draw_set_alpha(1);
    draw_set_colour(make_colour_rgb(220, 171, 64));
    draw_rectangle(18, 18, min(_gw - 18, 760), 94, true);
    draw_text(34, 28, "GOLDEN ACE SLOTS");
    draw_set_colour(c_white);
    draw_text(34, 50, "SPACE: spin reels, SHIFT: Bet 1, ENTER: cash out and return");
    draw_set_colour(make_colour_rgb(190, 174, 198));
    draw_text(34, 70, "One completed visit is enough to advance the escape lead.");
}

if (room == rm_cards) {
    draw_set_alpha(0.92);
    draw_set_colour(make_colour_rgb(13, 9, 21));
    draw_rectangle(18, 18, min(_gw - 18, 760), 94, false);
    draw_set_alpha(1);
    draw_set_colour(make_colour_rgb(220, 171, 64));
    draw_rectangle(18, 18, min(_gw - 18, 760), 94, true);
    draw_text(34, 28, "BLACK JACK");
    draw_set_colour(c_white);
    draw_text(34, 50, "SPACE: Start / Deal, SHIFT: Bet 1, Z: Hit, X: Stand, ENTER: Leave ");
    draw_set_colour(make_colour_rgb(190, 174, 198));
    draw_text(34, 70, "One completed visit is enough to advance the escape lead.");
}

// Objective ribbon.
if (room == casino) {
    draw_set_alpha(0.88);
    draw_set_colour(make_colour_rgb(13, 9, 21));
    draw_rectangle(18, 18, min(_gw - 18, 690), 72, false);
    draw_set_alpha(1);
    draw_set_colour(make_colour_rgb(220, 171, 64));
    draw_rectangle(18, 18, min(_gw - 18, 690), 72, true);
    draw_text(34, 28, "ESCAPE LEAD");
    draw_set_colour(c_white);
    draw_text(34, 48, objective_text);
}

if (dialogue_active && array_length(dialogue_lines) > 0) {
    // Some conversations use one speaker for several consecutive lines.
    // Clamp both lookups so the final supplied speaker is reused safely.
    var _line_index = clamp(dialogue_index, 0, array_length(dialogue_lines) - 1);
    var _speaker = "";
    if (array_length(dialogue_speakers) > 0) {
        var _speaker_index = clamp(_line_index, 0, array_length(dialogue_speakers) - 1);
        _speaker = dialogue_speakers[_speaker_index];
    }

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
    draw_text(_left + 24, _top + 18, _speaker);
    draw_set_colour(c_white);
    draw_text_ext(_left + 24, _top + 50, dialogue_lines[_line_index], 8, _right - _left - 48);
    draw_set_colour(make_colour_rgb(180, 166, 190));
    draw_text(_right - 245, _bottom - 26, "SPACE / E / ENTER  Continue");
}

draw_set_alpha(1);
draw_set_colour(c_white);
