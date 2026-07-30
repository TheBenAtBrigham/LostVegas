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

// Compact inventory status remains visible during exploration.
var _inventory_count = array_length(global.inventory);
var _selected_item = inventory_selected_item();
if (room == casino && !dialogue_active) {
    var _inv_right = _gw - 18;
    var _inv_left = max(18, _inv_right - 430);
    draw_set_alpha(0.88);
    draw_set_colour(make_colour_rgb(13, 9, 21));
    draw_rectangle(_inv_left, 18, _inv_right, 72, false);
    draw_set_alpha(1);
    draw_set_colour(make_colour_rgb(220, 171, 64));
    draw_rectangle(_inv_left, 18, _inv_right, 72, true);
    draw_text(_inv_left + 16, 28, "INVENTORY [I]");
    draw_set_colour(c_white);
    if (_selected_item == "") draw_text(_inv_left + 16, 49, "Empty");
    else draw_text(_inv_left + 16, 49, item_name(_selected_item));
    draw_set_colour(make_colour_rgb(180, 166, 190));
    draw_text(_inv_right - 72, 49, string(_inventory_count) + " item(s)");
}

// Full inventory panel with selection and usage instructions.
if (inventory_open && !dialogue_active) {
    var _panel_left = 80;
    var _panel_right = _gw - 80;
    var _panel_top = 126;
    var _panel_bottom = _gh - 74;

    draw_set_alpha(0.97);
    draw_set_colour(make_colour_rgb(12, 8, 18));
    draw_rectangle(_panel_left, _panel_top, _panel_right, _panel_bottom, false);
    draw_set_alpha(1);
    draw_set_colour(make_colour_rgb(220, 171, 64));
    draw_rectangle(_panel_left, _panel_top, _panel_right, _panel_bottom, true);
    draw_text(_panel_left + 24, _panel_top + 20, "MARA'S INVENTORY");

    draw_set_colour(make_colour_rgb(180, 166, 190));
    draw_text(_panel_left + 24, _panel_top + 44, "ARROW KEYS: select     E: use nearby     I: close");

    if (_inventory_count <= 0) {
        draw_set_colour(c_white);
        draw_text(_panel_left + 24, _panel_top + 92, "Nothing collected yet.");
    }
    else {
        var _card_y = _panel_top + 86;
        var _card_width = min(230, (_panel_right - _panel_left - 48) / max(1, _inventory_count));
        for (var _i = 0; _i < _inventory_count; _i++) {
            var _card_x = _panel_left + 24 + (_i * _card_width);
            var _is_selected = (_i == global.inventory_selected);
            draw_set_colour(_is_selected ? make_colour_rgb(82, 52, 76) : make_colour_rgb(31, 22, 39));
            draw_rectangle(_card_x, _card_y, _card_x + _card_width - 10, _card_y + 94, false);
            draw_set_colour(_is_selected ? make_colour_rgb(255, 218, 104) : make_colour_rgb(104, 82, 110));
            draw_rectangle(_card_x, _card_y, _card_x + _card_width - 10, _card_y + 94, true);
            draw_set_colour(c_white);
            draw_text_ext(_card_x + 10, _card_y + 12, item_name(global.inventory[_i]), 5, _card_width - 30);
        }

        draw_set_colour(make_colour_rgb(255, 218, 104));
        draw_text(_panel_left + 24, _card_y + 126, item_name(_selected_item));
        draw_set_colour(c_white);
        draw_text_ext(_panel_left + 24, _card_y + 150, item_description(_selected_item), 7, _panel_right - _panel_left - 48);

        if (puzzle_target != "") {
            draw_set_colour(make_colour_rgb(104, 236, 166));
            draw_text(_panel_left + 24, _panel_bottom - 42, "Nearby target: " + string_upper(puzzle_target) + " -- press E to use selected item");
        }
    }
}

if (inventory_message_timer > 0 && inventory_message != "" && !dialogue_active) {
    var _msg_width = string_width(inventory_message) + 40;
    var _msg_left = (_gw - _msg_width) * 0.5;
    draw_set_alpha(0.94);
    draw_set_colour(make_colour_rgb(12, 8, 18));
    draw_rectangle(_msg_left, _gh - 58, _msg_left + _msg_width, _gh - 24, false);
    draw_set_alpha(1);
    draw_set_colour(make_colour_rgb(255, 218, 104));
    draw_rectangle(_msg_left, _gh - 58, _msg_left + _msg_width, _gh - 24, true);
    draw_text(_msg_left + 20, _gh - 48, inventory_message);
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
