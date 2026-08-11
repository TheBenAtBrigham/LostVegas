/// FILE: obj_title / Draw event
/// Matches the casino room's noir/gold colour palette so the title
/// screen doesn't feel visually disconnected from the game itself.

draw_clear(make_colour_rgb(14, 8, 20));

var _gw = display_get_gui_width() > 0 ? room_width : room_width;
var _cx = room_width / 2;
var _cy = (room_height / 2) - 50;

draw_sprite(spr_roger, 0, _cx+100, y+80);

// Soft glow behind the title.
draw_set_alpha(0.15);
draw_set_colour(make_colour_rgb(255, 210, 90));
draw_circle(_cx, _cy, 120, false);
draw_set_alpha(1);

// Title text, with the same layered glow/shadow/highlight trick used
// on "THE GOLDEN ACE" in the casino room.
draw_set_font(-1);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_alpha(0.3);
draw_set_colour(make_colour_rgb(255, 210, 90));
draw_text(_cx + 2, _cy - 40 + 2, "LOST VEGAS");
draw_set_alpha(1);
draw_set_colour(make_colour_rgb(80, 50, 10));
draw_text(_cx + 1, _cy - 40 + 1, "LOST VEGAS");
draw_set_colour(make_colour_rgb(248, 214, 122));
draw_text(_cx, _cy - 40, "LOST VEGAS");

draw_set_colour(make_colour_rgb(200, 180, 190));
draw_text(_cx, _cy, "escape the Golden Ace");

for (var _i = 0; _i < array_length(menu_options); _i++) {
    var _menu_y = _cy + 58 + (_i * 42);
    var _enabled = (_i != 0) || save_available;
    if (_i == menu_selected && show_prompt) {
        draw_set_colour(make_colour_rgb(248, 214, 122));
        draw_text(_cx - 110, _menu_y, "> ");
    }
    draw_set_colour(_enabled ? c_white : make_colour_rgb(100, 90, 105));
    draw_text(_cx, _menu_y, menu_options[_i]);
}

draw_set_colour(make_colour_rgb(170, 150, 174));
draw_text(_cx, _cy + 154, status_text);
draw_text(_cx, _cy + 184, "UP / DOWN: select     ENTER / SPACE: confirm");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
draw_set_alpha(1);



