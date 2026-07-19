/// obj_player - Create event (FINAL)

walking_speed = PLAYER_SPEED; // from MACROS
h_speed = 0;
v_speed = 0;
is_moving = false;
input_direction = 0;
input_magnitude = 0;

walk_spr = spr_playceholder_walk;
idle_spr = spr_playceholder_idle;
sprite_index = idle_spr;
image_speed = 0;
local_frame = 0;

if (!variable_global_exists("player_credits")) {
    global.player_credits = 0;
}

/// Tests the player's small foot-level collision box against casino furniture/walls.
/// Reads from global.casino_solids, set up in obj_casino_room's Create event.
position_is_blocked = function(_x, _y) {
    if (!variable_global_exists("casino_solids")) return false;
    var _left = _x - 6;
    var _right = _x + 6;
    var _top = _y - 15;
    var _bottom = _y - 1;
    for (var _i = 0; _i < array_length(global.casino_solids); _i++) {
        var _r = global.casino_solids[_i];
        if (_right > _r[0] && _left < _r[2] && _bottom > _r[1] && _top < _r[3]) {
            return true;
        }
    }
    return false;
};
