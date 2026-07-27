/// @function     player_anim_script()
/// @description  Advances the current instance's 4-directional walk/idle
///               animation based on its `direction`, the current sprite's
///               built-in speed, and the project frame rate.
///
///               The sprite sheet is expected to be laid out with all
///               directions in a single strip, in this order:
///
///                   Row 0 : facing RIGHT
///                   Row 1 : facing UP
///                   Row 2 : facing LEFT
///                   Row 3 : facing DOWN
///
///               Each "row" contains (sprite_get_number / 4) frames.
///
/// @requires     Instance variables:
///                   local_frame   (real)  - current sub-frame counter
///                   animation_end (bool)  - set true on the frame the
///                                           animation loops
///
/// @requires     MACROS: FRAME_RATE, ANIM_DIRECTIONS
///
/// @returns      {void}
// =============================================================================

function player_anim_script()
{
    // ---------------------------------------------------------------------
    // Guard against missing sprite (avoids divide-by-zero / bad image_index)
    // ---------------------------------------------------------------------
    if (sprite_index == -1) return;

    var _total_frames = sprite_get_number(sprite_index) / ANIM_DIRECTIONS;
    if (_total_frames <= 0) return;

    // ---------------------------------------------------------------------
    // Pick the row of the sprite sheet that matches the facing direction.
    // `direction` is 0-360; snapping to the nearest 90° gives us 0..4,
    // and wrapping with modulo folds 360° back onto row 0 (right).
    // ---------------------------------------------------------------------
    var _cardinal = round(direction / 90) mod ANIM_DIRECTIONS;

    // ---------------------------------------------------------------------
    // Advance the local frame counter using the sprite's own speed, scaled
    // by our fixed frame rate so animations play at a consistent tempo
    // regardless of room_speed changes.
    // ---------------------------------------------------------------------
    local_frame += sprite_get_speed(sprite_index) / FRAME_RATE;

    if (local_frame >= _total_frames)
    {
        local_frame  -= _total_frames;
        animation_end = true;
    }
    else
    {
        animation_end = false;
    }

    // ---------------------------------------------------------------------
    // Compose the final image index: base offset for the row, plus the
    // current sub-frame within that row.
    // ---------------------------------------------------------------------
    image_index = (_cardinal * _total_frames) + floor(local_frame);
}