/// FILE: obj_casino_room / Create event (v2 — adds furniture collision)
/// PASTE ONLY INTO: obj_casino_room -> Create event tab
/// DO NOT paste any part of this into obj_player.

cam = view_camera[0];
cam_w = camera_get_view_width(cam);
cam_h = camera_get_view_height(cam);

if (!view_enabled) {
    view_enabled = true;
    view_visible[0] = true;
}

cam_x = obj_player.x - (cam_w / 2);
cam_y = obj_player.y - (cam_h / 2);

// Collision rectangles matching the walls AND furniture drawn in the Draw event.
// obj_player's position_is_blocked() function reads this array directly.
global.casino_solids = [
    // --- Outer walls ---
    [0,   0,   640, 24],   // top wall
    [0,   24,  20,  360],  // left wall
    [620, 24,  640, 360],  // right wall
    [20,  340, 292, 360],  // bottom wall, left of entrance
    [348, 340, 620, 360],  // bottom wall, right of entrance

    // --- Cashier desk ---
    [42,  58,  158, 82],

    // --- Bar (counter + back cabinet) ---
    [452, 46,  594, 68],
    [468, 82,  586, 100],

    // --- Slot machine banks (left side, 2 rows x 3 cols) ---
    [62,  132, 62+32,  132+38],
    [106, 132, 106+32, 132+38],
    [150, 132, 150+32, 132+38],
    [62,  194, 62+32,  194+38],
    [106, 194, 106+32, 194+38],
    [150, 194, 150+32, 194+38],

    // --- Slot machine banks (right side, 2 rows x 3 cols) ---
    [446, 132, 446+32, 132+38],
    [490, 132, 490+32, 132+38],
    [534, 132, 534+32, 132+38],
    [446, 194, 446+32, 194+38],
    [490, 194, 490+32, 194+38],
    [534, 194, 534+32, 194+38],

    // --- Roulette table ---
    [264, 116, 376, 174],

    // --- Card tables ---
    [238, 216, 238+64, 264],
    [338, 216, 338+64, 264],

    // --- Planters ---
    [58-12,  306, 58+12,  324],
    [582-12, 306, 582+12, 324]
];
