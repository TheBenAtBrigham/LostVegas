/// obj_casino_room - Draw event (FINAL)
/// Draw the first casino room

draw_clear(make_colour_rgb(20, 12, 27));

// Marble floor and carpet runner.
draw_set_colour(make_colour_rgb(61, 42, 65));
draw_rectangle(20, 24, 620, 340, false);
draw_set_colour(make_colour_rgb(86, 22, 42));
draw_rectangle(292, 24, 348, 340, false);
draw_set_colour(make_colour_rgb(218, 170, 62));
draw_rectangle(296, 24, 300, 340, false);
draw_rectangle(340, 24, 344, 340, false);

// Subtle floor tiles.
draw_set_alpha(0.16);
draw_set_colour(c_white);
for (var _x = 20; _x <= 620; _x += 32) draw_line(_x, 24, _x, 340);
for (var _y = 24; _y <= 340; _y += 32) draw_line(20, _y, 620, _y);
draw_set_alpha(1);

// Walls, gold trim, entrance and north exit.
draw_set_colour(make_colour_rgb(34, 22, 42));
draw_rectangle(0, 0, 640, 24, false);
draw_rectangle(0, 24, 20, 360, false);
draw_rectangle(620, 24, 640, 360, false);
draw_rectangle(20, 340, 292, 360, false);
draw_rectangle(348, 340, 620, 360, false);
draw_set_colour(make_colour_rgb(204, 151, 45));
draw_rectangle(20, 22, 620, 25, false);
draw_rectangle(18, 24, 21, 340, false);
draw_rectangle(619, 24, 622, 340, false);
draw_rectangle(20, 338, 292, 341, false);
draw_rectangle(348, 338, 620, 341, false);

// Exit doors and glowing EXIT sign.
draw_set_colour(make_colour_rgb(18, 55, 50));
draw_rectangle(292, 4, 348, 24, false);
draw_set_colour(make_colour_rgb(72, 240, 166));
draw_rectangle(300, 7, 340, 19, false);
draw_set_colour(c_black);
draw_text(307, 7, "EXIT");

// Reception desk.
draw_set_colour(make_colour_rgb(83, 39, 24));
draw_rectangle(42, 58, 158, 82, false);
draw_set_colour(make_colour_rgb(223, 171, 63));
draw_rectangle(42, 58, 158, 63, false);
draw_set_colour(c_white);
draw_text(62, 66, "CASHIER");

// Bar and shelves.
draw_set_colour(make_colour_rgb(56, 26, 25));
draw_rectangle(452, 46, 594, 68, false);
draw_set_colour(make_colour_rgb(205, 146, 48));
draw_rectangle(452, 46, 594, 51, false);
draw_set_colour(make_colour_rgb(74, 35, 31));
draw_rectangle(468, 82, 586, 100, false);
draw_set_colour(c_white);
draw_text(512, 52, "BAR");
var _bottle_colours = [c_red, c_lime, c_aqua, c_yellow, c_fuchsia, c_orange];
for (var _b = 0; _b < 6; _b++) {
    draw_set_colour(_bottle_colours[_b]);
    draw_rectangle(476 + _b * 17, 86, 482 + _b * 17, 96, false);
}

// Slot machine banks.
for (var _side = 0; _side < 2; _side++) {
    var _base_x = (_side == 0) ? 62 : 446;
    for (var _row = 0; _row < 2; _row++) {
        for (var _col = 0; _col < 3; _col++) {
            var _sx = _base_x + _col * 44;
            var _sy = 132 + _row * 62;
            draw_set_colour(make_colour_rgb(29, 34, 55));
            draw_rectangle(_sx, _sy, _sx + 32, _sy + 38, false);
            draw_set_colour(make_colour_rgb(230, 176, 50));
            draw_rectangle(_sx + 3, _sy + 3, _sx + 29, _sy + 8, false);
            draw_set_colour(make_colour_rgb(32, 174, 183));
            draw_rectangle(_sx + 5, _sy + 12, _sx + 27, _sy + 27, false);
            draw_set_colour(c_white);
            draw_text(_sx + 9, _sy + 13, "777");
            draw_set_colour(c_red);
            draw_circle(_sx + 16, _sy + 33, 2, false);
        }
    }
}

// Central roulette table.
draw_set_colour(make_colour_rgb(18, 92, 59));
draw_roundrect(264, 116, 376, 174, false);
draw_set_colour(make_colour_rgb(220, 171, 54));
draw_roundrect(264, 116, 376, 174, true);
draw_circle(320, 145, 20, true);
draw_set_colour(c_red);
draw_circle(320, 145, 10, false);

// Two card tables.
for (var _t = 0; _t < 2; _t++) {
    var _tx = 238 + _t * 100;
    draw_set_colour(make_colour_rgb(17, 100, 63));
    draw_roundrect(_tx, 216, _tx + 64, 264, false);
    draw_set_colour(make_colour_rgb(218, 168, 55));
    draw_roundrect(_tx, 216, _tx + 64, 264, true);
    draw_set_colour(c_white);
    draw_rectangle(_tx + 21, 231, _tx + 27, 240, false);
    draw_rectangle(_tx + 37, 238, _tx + 43, 247, false);
}

// Plants and wall lights.
for (var _p = 0; _p < 2; _p++) {
    var _px = (_p == 0) ? 58 : 582;
    draw_set_colour(make_colour_rgb(112, 55, 34));
    draw_rectangle(_px - 12, 306, _px + 12, 324, false);
    draw_set_colour(make_colour_rgb(43, 140, 73));
    draw_circle(_px, 299, 13, false);
}
draw_set_colour(make_colour_rgb(255, 208, 89));
for (var _lamp = 0; _lamp < 5; _lamp++) draw_circle(110 + _lamp * 105, 32, 4, false);

// Entrance mat and room title.
draw_set_colour(make_colour_rgb(35, 21, 42));
draw_rectangle(292, 326, 348, 340, false);
draw_set_colour(make_colour_rgb(230, 183, 65));
draw_text(269, 30, "THE GOLDEN ACE");

if (instance_exists(obj_player) && obj_player.y < 62) {
    draw_set_colour(make_colour_rgb(12, 8, 18));
    draw_rectangle(234, 70, 406, 91, false);
    draw_set_colour(make_colour_rgb(255, 218, 104));
    draw_text(248, 75, "THE EXIT IS LOCKED");
}

draw_set_colour(c_white);
draw_set_alpha(1);
