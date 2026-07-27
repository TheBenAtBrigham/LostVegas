/// obj_casino_room - Step event (FINAL — smooth camera)

if (instance_exists(obj_player)) {
    var _tx = obj_player.x - (cam_w / 2);
    var _ty = obj_player.y - (cam_h / 2);

    _tx = clamp(_tx, 0, max(0, room_width - cam_w));
    _ty = clamp(_ty, 0, max(0, room_height - cam_h));

    // Ease toward the target instead of snapping — reads far more polished
    cam_x = lerp(cam_x, _tx, 0.12);
    cam_y = lerp(cam_y, _ty, 0.12);

    camera_set_view_pos(cam, cam_x, cam_y);
}
