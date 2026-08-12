/// Draw the first casino room — polished pass.
/// Collision rectangles in Create_0 are unchanged; only the visuals were refined.
if (room == casino)
{
// ---------- Palette ----------
var _c_floor_dark   = make_colour_rgb(38, 24, 44);
var _c_floor        = make_colour_rgb(61, 42, 65);
var _c_floor_hi     = make_colour_rgb(78, 55, 82);
var _c_carpet_dark  = make_colour_rgb(64, 14, 30);
var _c_carpet       = make_colour_rgb(96, 24, 46);
var _c_carpet_hi    = make_colour_rgb(126, 34, 60);
var _c_gold         = make_colour_rgb(218, 170, 62);
var _c_gold_hi      = make_colour_rgb(248, 214, 122);
var _c_gold_dk      = make_colour_rgb(150, 108, 30);
var _c_wall         = make_colour_rgb(34, 22, 42);
var _c_wall_hi      = make_colour_rgb(52, 34, 62);
var _c_wall_shadow  = make_colour_rgb(16, 10, 22);
var _c_felt         = make_colour_rgb(18, 92, 59);
var _c_felt_dk      = make_colour_rgb(10, 60, 40);
var _c_felt_hi      = make_colour_rgb(30, 122, 78);
var _c_wood         = make_colour_rgb(70, 34, 22);
var _c_wood_hi      = make_colour_rgb(104, 56, 34);

// ---------- Background ----------
draw_clear(make_colour_rgb(14, 8, 20));

// ---------- Floor ----------
draw_set_colour(_c_floor);
draw_rectangle(20, 24, 620, 340, false);

// Diamond marble pattern.
draw_set_alpha(0.10);
draw_set_colour(_c_floor_hi);
for (var _y = 24; _y < 340; _y += 32) {
    for (var _x = 20; _x < 620; _x += 32) {
        var _cx = _x + 16, _cy = _y + 16;
        draw_triangle(_cx, _y + 4, _x + 28, _cy, _cx, _y + 28, false);
        draw_triangle(_cx, _y + 4, _x + 4,  _cy, _cx, _y + 28, false);
    }
}
draw_set_alpha(1);

// Soft floor grid.
draw_set_alpha(0.06);
draw_set_colour(c_black);
for (var _x = 20; _x <= 620; _x += 32) draw_line(_x, 24, _x, 340);
for (var _y = 24; _y <= 340; _y += 32) draw_line(20, _y, 620, _y);
draw_set_alpha(1);

// ---------- Carpet runner ----------
draw_set_colour(_c_carpet_dark);
draw_rectangle(288, 24, 352, 340, false);
draw_set_colour(_c_carpet);
draw_rectangle(292, 24, 348, 340, false);
// Center highlight stripe.
draw_set_alpha(0.35);
draw_set_colour(_c_carpet_hi);
draw_rectangle(316, 24, 324, 340, false);
draw_set_alpha(1);
// Gold trim rails.
draw_set_colour(_c_gold);
draw_rectangle(295, 24, 299, 340, false);
draw_rectangle(341, 24, 345, 340, false);
draw_set_colour(_c_gold_hi);
draw_rectangle(296, 24, 297, 340, false);
draw_rectangle(342, 24, 343, 340, false);

// ---------- Walls ----------
draw_set_colour(_c_wall);
draw_rectangle(0,   0,   640, 24,  false);
draw_rectangle(0,   24,  20,  360, false);
draw_rectangle(620, 24,  640, 360, false);
draw_rectangle(20,  340, 292, 360, false);
draw_rectangle(348, 340, 620, 360, false);

// Wall highlight edge (top).
draw_set_colour(_c_wall_hi);
draw_rectangle(0, 0, 640, 4, false);

// Inner shadow along walls (soft ambient occlusion).
draw_set_alpha(0.35);
draw_set_colour(_c_wall_shadow);
draw_rectangle(20, 24, 620, 30, false);      // under top wall
draw_rectangle(20, 24, 26, 340, false);      // right of left wall
draw_rectangle(614, 24, 620, 340, false);    // left of right wall
draw_rectangle(20, 334, 292, 340, false);    // above bottom-left wall
draw_rectangle(348, 334, 620, 340, false);   // above bottom-right wall
draw_set_alpha(1);

// Gold trim (double line).
draw_set_colour(_c_gold_dk);
draw_rectangle(20, 21, 620, 23, false);
draw_rectangle(17, 24, 19, 340, false);
draw_rectangle(621, 24, 623, 340, false);
draw_rectangle(20, 341, 292, 343, false);
draw_rectangle(348, 341, 620, 343, false);
draw_set_colour(_c_gold);
draw_rectangle(20, 23, 620, 24, false);
draw_rectangle(19, 24, 20, 340, false);
draw_rectangle(620, 24, 621, 340, false);
draw_rectangle(20, 340, 292, 341, false);
draw_rectangle(348, 340, 620, 341, false);

// ---------- North exit doors + sign ----------
draw_set_colour(make_colour_rgb(14, 40, 36));
draw_rectangle(292, 4, 348, 24, false);
draw_set_colour(make_colour_rgb(22, 66, 58));
draw_rectangle(294, 6, 346, 22, false);
draw_set_colour(_c_gold);
draw_rectangle(319, 4, 321, 24, false); // door split
// Glowing EXIT sign.
draw_set_alpha(0.35);
draw_set_colour(make_colour_rgb(72, 240, 166));
draw_rectangle(296, 5, 344, 21, false);
draw_set_alpha(1);
draw_set_colour(make_colour_rgb(72, 240, 166));
draw_rectangle(300, 7, 340, 19, false);
draw_set_colour(c_black);
draw_text(307, 7, "EXIT");

// ---------- Cashier / reception desk ----------
// Shadow.
draw_set_alpha(0.28);
draw_set_colour(c_black);
draw_rectangle(46, 82, 162, 88, false);
draw_set_alpha(1);
// Base.
draw_set_colour(_c_wood);
draw_rectangle(42, 58, 158, 82, false);
draw_set_colour(_c_wood_hi);
draw_rectangle(42, 58, 158, 64, false);
draw_set_colour(_c_gold);
draw_rectangle(42, 58, 158, 60, false);
draw_set_colour(_c_gold_hi);
draw_rectangle(42, 58, 158, 59, false);
// Wood grain panels.
draw_set_colour(_c_gold_dk);
for (var _p = 0; _p < 3; _p++) {
    var _px = 54 + _p * 36;
    draw_rectangle(_px, 66, _px + 24, 80, true);
}
draw_set_colour(c_white);
draw_text(70, 66, "CASHIER");

// ---------- Bar ----------
// Back cabinet shadow.
draw_set_alpha(0.30);
draw_set_colour(c_black);
draw_rectangle(456, 68, 598, 74, false);
draw_set_alpha(1);
// Back cabinet.
draw_set_colour(make_colour_rgb(48, 22, 22));
draw_rectangle(468, 82, 586, 100, false);
draw_set_colour(_c_gold_dk);
draw_rectangle(468, 82, 586, 84, false);
// Bottles.
var _bottle_colours = [
    make_colour_rgb(200, 40, 55),
    make_colour_rgb(120, 200, 80),
    make_colour_rgb(70, 200, 210),
    make_colour_rgb(230, 200, 80),
    make_colour_rgb(190, 90, 190),
    make_colour_rgb(230, 140, 60)
];
for (var _b = 0; _b < 6; _b++) {
    var _bx = 476 + _b * 17;
    draw_set_colour(_bottle_colours[_b]);
    draw_rectangle(_bx, 86, _bx + 6, 96, false);
    draw_set_alpha(0.45);
    draw_set_colour(c_white);
    draw_rectangle(_bx + 1, 87, _bx + 2, 94, false);
    draw_set_alpha(1);
}
// Bar counter.
draw_set_colour(make_colour_rgb(48, 22, 22));
draw_rectangle(452, 46, 594, 68, false);
draw_set_colour(make_colour_rgb(78, 40, 32));
draw_rectangle(452, 50, 594, 54, false);
draw_set_colour(_c_gold);
draw_rectangle(452, 46, 594, 50, false);
draw_set_colour(_c_gold_hi);
draw_rectangle(452, 46, 594, 47, false);
draw_set_colour(c_white);
draw_text(514, 52, "BAR");

// ---------- Slot machines ----------
for (var _side = 0; _side < 2; _side++) {
    var _base_x = (_side == 0) ? 62 : 446;
    for (var _row = 0; _row < 2; _row++) {
        for (var _col = 0; _col < 3; _col++) {
            var _sx = _base_x + _col * 44;
            var _sy = 132 + _row * 62;

            // Shadow.
            draw_set_alpha(0.35);
            draw_set_colour(c_black);
            draw_rectangle(_sx + 2, _sy + 38, _sx + 32, _sy + 42, false);
            draw_set_alpha(1);

            // Cabinet.
            draw_set_colour(make_colour_rgb(20, 24, 42));
            draw_rectangle(_sx, _sy, _sx + 32, _sy + 38, false);
            draw_set_colour(make_colour_rgb(38, 46, 72));
            draw_rectangle(_sx, _sy, _sx + 32, _sy + 4, false);
            // Gold crown.
            draw_set_colour(_c_gold);
            draw_rectangle(_sx + 2, _sy + 2, _sx + 30, _sy + 8, false);
            draw_set_colour(_c_gold_hi);
            draw_rectangle(_sx + 2, _sy + 2, _sx + 30, _sy + 3, false);

            // Reel window frame.
            draw_set_colour(c_black);
            draw_rectangle(_sx + 4, _sy + 11, _sx + 28, _sy + 28, false);
            // Reels.
            draw_set_colour(make_colour_rgb(240, 236, 220));
            draw_rectangle(_sx + 5, _sy + 12, _sx + 12, _sy + 27, false);
            draw_rectangle(_sx + 13, _sy + 12, _sx + 20, _sy + 27, false);
            draw_rectangle(_sx + 21, _sy + 12, _sx + 27, _sy + 27, false);
            // Symbols.
            draw_set_colour(make_colour_rgb(200, 30, 40));
            draw_text(_sx + 6,  _sy + 13, "7");
            draw_text(_sx + 14, _sy + 13, "7");
            draw_text(_sx + 22, _sy + 13, "7");

            // Coin slot.
            draw_set_colour(c_black);
            draw_rectangle(_sx + 10, _sy + 30, _sx + 22, _sy + 32, false);
            // Lever.
            draw_set_colour(_c_gold_dk);
            draw_rectangle(_sx + 30, _sy + 14, _sx + 33, _sy + 22, false);
            draw_set_colour(c_red);
            draw_circle(_sx + 32, _sy + 13, 2, false);
            // Base LED.
            draw_set_colour(make_colour_rgb(255, 120, 120));
            draw_circle(_sx + 16, _sy + 35, 1.5, false);
            draw_set_alpha(0.4);
            draw_circle(_sx + 16, _sy + 35, 3, false);
            draw_set_alpha(1);
        }
    }
}

// ---------- Roulette \ ----------
// Shadow.
draw_set_alpha(0.35);
draw_set_colour(c_black);
draw_roundrect(268, 122, 380, 180, false);
draw_set_alpha(1);
// Felt.
draw_set_colour(_c_felt_dk);
draw_roundrect(264, 116, 376, 174, false);
draw_set_colour(_c_felt);
draw_roundrect(266, 118, 374, 172, false);
// Gold rim.
draw_set_colour(_c_gold);
draw_roundrect(264, 116, 376, 174, true);
draw_set_colour(_c_gold_hi);
draw_roundrect(265, 117, 375, 173, true);
// Wheel.
draw_set_colour(_c_gold_dk);
draw_circle(320, 145, 22, false);
draw_set_colour(make_colour_rgb(30, 20, 22));
draw_circle(320, 145, 20, false);
// Alternating red/black pockets.
for (var _s = 0; _s < 12; _s++) {
    var _a1 = (_s / 12) * 360;
    var _a2 = ((_s + 1) / 12) * 360;
    draw_set_colour((_s mod 2 == 0) ? make_colour_rgb(170, 24, 34) : make_colour_rgb(22, 14, 20));
    var _px1 = 320 + lengthdir_x(18, _a1);
    var _py1 = 145 + lengthdir_y(18, _a1);
    var _px2 = 320 + lengthdir_x(18, _a2);
    var _py2 = 145 + lengthdir_y(18, _a2);
    draw_triangle(320, 145, _px1, _py1, _px2, _py2, false);
}
for (var _s = 0; _s < 2; _s++) {
    var _a1 = (_s / 12) * 360;
    var _a2 = ((_s + 1) / 12) * 360;
    draw_set_colour((_s mod 2 == 0) ? make_colour_rgb(170, 24, 34) : make_colour_rgb(144, 238, 144));
    var _px1 = 320 + lengthdir_x(18, _a1);
    var _py1 = 145 + lengthdir_y(18, _a1);
    var _px2 = 320 + lengthdir_x(18, _a2);
    var _py2 = 145 + lengthdir_y(18, _a2);
    draw_triangle(320, 145, _px1, _py1, _px2, _py2, false);
}
// Hub.
draw_set_colour(_c_gold);
draw_circle(320, 145, 6, false);
draw_set_colour(_c_gold_hi);
draw_circle(320, 145, 3, false);
// Number strip highlights on felt.
draw_set_colour(_c_gold);
for (var _n = 0; _n < 6; _n++) {
    draw_rectangle(272 + _n * 17, 165, 285 + _n * 17, 168, true);
}

// ---------- Card tables ----------
for (var _t = 0; _t < 2; _t++) {
    var _tx = 238 + _t * 100;
    // Shadow.
    draw_set_alpha(0.35);
    draw_set_colour(c_black);
    draw_roundrect(_tx + 4, 222, _tx + 68, 270, false);
    draw_set_alpha(1);
    // Felt.
    draw_set_colour(_c_felt_dk);
    draw_roundrect(_tx, 216, _tx + 64, 264, false);
    draw_set_colour(_c_felt);
    draw_roundrect(_tx + 2, 218, _tx + 62, 262, false);
    // Center curved highlight.
    draw_set_alpha(0.25);
    draw_set_colour(_c_felt_hi);
    draw_roundrect(_tx + 8, 224, _tx + 56, 244, false);
    draw_set_alpha(1);
    // Gold rim.
    draw_set_colour(_c_gold);
    draw_roundrect(_tx, 216, _tx + 64, 264, true);
    // Chip stacks.
    var _chip_cols = [c_red, c_white, make_colour_rgb(40, 40, 200)];
    for (var _c = 0; _c < 3; _c++) {
        draw_set_colour(_chip_cols[_c]);
        draw_circle(_tx + 14 + _c * 10, 252, 3, false);
        draw_set_colour(c_black);
        draw_circle(_tx + 14 + _c * 10, 252, 3, true);
    }
    // Cards.
    draw_set_colour(c_black);
    draw_rectangle(_tx + 20, 230, _tx + 28, 241, false);
    draw_rectangle(_tx + 36, 237, _tx + 44, 248, false);
    draw_set_colour(c_white);
    draw_rectangle(_tx + 21, 231, _tx + 27, 240, false);
    draw_rectangle(_tx + 37, 238, _tx + 43, 247, false);
    draw_set_colour(c_red);
    draw_text(_tx + 22, 231, "A");
    draw_text(_tx + 38, 238, "K");
}

// ---------- Planters ----------
for (var _p = 0; _p < 2; _p++) {
    var _px = (_p == 0) ? 58 : 582;
    // Shadow.
    draw_set_alpha(0.30);
    draw_set_colour(c_black);
    draw_ellipse(_px - 14, 322, _px + 14, 330, false);
    draw_set_alpha(1);
    // Pot.
    draw_set_colour(make_colour_rgb(80, 38, 22));
    draw_rectangle(_px - 12, 306, _px + 12, 324, false);
    draw_set_colour(make_colour_rgb(112, 56, 32));
    draw_rectangle(_px - 12, 306, _px + 12, 310, false);
    draw_set_colour(_c_gold_dk);
    draw_rectangle(_px - 12, 306, _px + 12, 307, false);
    // Foliage — layered circles for depth.
    draw_set_colour(make_colour_rgb(24, 82, 40));
    draw_circle(_px - 6, 300, 8, false);
    draw_circle(_px + 6, 300, 8, false);
    draw_circle(_px,     294, 9, false);
    draw_set_colour(make_colour_rgb(50, 148, 78));
    draw_circle(_px - 4, 298, 5, false);
    draw_circle(_px + 4, 298, 5, false);
    draw_circle(_px,     292, 6, false);
    draw_set_colour(make_colour_rgb(96, 190, 110));
    draw_circle(_px - 2, 296, 2, false);
    draw_circle(_px + 3, 297, 2, false);
}

// ---------- Chandelier / wall lights ----------
for (var _lamp = 0; _lamp < 5; _lamp++) {
    var _lx = 110 + _lamp * 105;
    // Glow halo.
    draw_set_alpha(0.10);
    draw_set_colour(make_colour_rgb(255, 220, 130));
    draw_circle(_lx, 32, 14, false);
    draw_set_alpha(0.22);
    draw_circle(_lx, 32, 8, false);
    draw_set_alpha(1);
    // Fixture.
    draw_set_colour(_c_gold_dk);
    draw_circle(_lx, 32, 5, false);
    draw_set_colour(make_colour_rgb(255, 220, 120));
    draw_circle(_lx, 32, 3, false);
    draw_set_colour(c_white);
    draw_circle(_lx, 31, 1, false);
}

// ---------- Entrance mat & title ----------
// Mat shadow.
draw_set_alpha(0.30);
draw_set_colour(c_black);
draw_rectangle(292, 332, 348, 340, false);
draw_set_alpha(1);
draw_set_colour(make_colour_rgb(28, 16, 34));
draw_rectangle(292, 326, 348, 340, false);
draw_set_colour(_c_gold_dk);
draw_rectangle(294, 328, 346, 330, false);
draw_rectangle(294, 336, 346, 338, false);

// Title with soft glow + drop shadow.
draw_set_alpha(0.25);
draw_set_colour(make_colour_rgb(255, 210, 90));
draw_text(270, 31, "THE GOLDEN ACE");
draw_set_alpha(1);
draw_set_colour(make_colour_rgb(80, 50, 10));
draw_text(270, 31, "THE GOLDEN ACE");
draw_set_colour(_c_gold_hi);
draw_text(269, 30, "THE GOLDEN ACE");

// ---------- Locked-exit warning ----------
if (instance_exists(obj_player) && obj_player.y < 62) {
    draw_set_alpha(0.85);
    draw_set_colour(make_colour_rgb(12, 8, 18));
    draw_rectangle(232, 68, 408, 93, false);
    draw_set_alpha(1);
    draw_set_colour(_c_gold);
    draw_rectangle(232, 68, 408, 93, true);
    draw_set_colour(make_colour_rgb(255, 218, 104));
    draw_text(248, 75, "THE EXIT IS LOCKED");
}

// Reset draw state.
draw_set_colour(c_white);
draw_set_alpha(1);
}