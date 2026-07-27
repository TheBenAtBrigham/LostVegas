/// player_anim_script() - FINAL (called with no arguments)

function player_anim_script() {
    // Flip to face left/right based on horizontal movement only
    // (keeps last facing direction when moving purely up/down)
    if (h_speed != 0) {
        image_xscale = sign(h_speed);
    }

    if (is_moving) {
        image_speed = PLAYER_ANIM_SPEED;
    } else {
        image_index = 0;
        image_speed = 0;
    }
}
