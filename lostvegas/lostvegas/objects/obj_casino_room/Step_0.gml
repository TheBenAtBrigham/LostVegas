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




















