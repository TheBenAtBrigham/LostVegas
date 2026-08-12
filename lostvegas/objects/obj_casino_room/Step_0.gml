/// FILE: obj_casino_room / Step event
/// PASTE ONLY INTO: obj_casino_room -> Step event tab
/// DO NOT paste any part of this into obj_player.
/// This event has NOTHING to do with walking_speed, h_speed, or PLAYER_SPEED —
/// if you ever see those words in this event, you pasted the wrong file here.
/// This event ONLY moves the camera. It does not move the player.

if (instance_exists(obj_player)) {
    var _tx = obj_player.x - (cam_w / 2);
    var _ty = obj_player.y - (cam_h / 2);

    _tx = clamp(_tx, 0, max(0, room_width - cam_w));
    _ty = clamp(_ty, 0, max(0, room_height - cam_h));

    // Smoothly ease the camera toward the player instead of snapping.
    cam_x = lerp(cam_x, _tx, 0.12);
    cam_y = lerp(cam_y, _ty, 0.12);

    camera_set_view_pos(cam, cam_x, cam_y);
}


if (global.story_stage >= 5 && room == casino){
	global.casino_solids = [
    // --- Outer walls ---
	//[0,   0,   640, 24], 
    [0,   0,   292, 24],   // top wall left of exit
	[348,   0, 640, 24],   // right of exit
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
} else if (room != casino) {
	global.casino_solids = [
    // --- Outer walls ---
	//[0,   0,   640, 24], 
    [0,   0,   292, 24],   // top wall left of exit
	[348,   0, 640, 24],   // right of exit
    [0,   24,  20,  360],  // left wall
    [620, 24,  640, 360],  // right wall
    [20,  340, 292, 360],  // bottom wall, left of entrance
    [348, 340, 620, 360],  // bottom wall, right of entrance

   

    // --- Planters ---
    [58-12,  306, 58+12,  324],
    [582-12, 306, 582+12, 324]
];

}


















