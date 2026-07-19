/// obj_casino_room - Create event (FINAL)

// --- Camera setup ---
cam = view_camera[0];
cam_w = camera_get_view_width(cam);
cam_h = camera_get_view_height(cam);

if (!view_enabled) {
    view_enabled = true;
    view_visible[0] = true;
}

cam_x = obj_player.x - (cam_w / 2);
cam_y = obj_player.y - (cam_h / 2);

// --- Collision data, matching the Draw event's wall coordinates exactly ---
// obj_player's position_is_blocked() reads this array — no wall objects needed.
global.casino_solids = [
    [0,   0,   640, 24],   // top wall
    [0,   24,  20,  360],  // left wall
    [620, 24,  640, 360],  // right wall
    [20,  340, 292, 360],  // bottom wall, left of entrance
    [348, 340, 620, 360],  // bottom wall, right of entrance
];
// Gap from x=292 to x=348 at y=340-360 is left open — that's the entrance/exit
