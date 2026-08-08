/// obj_player — Create event (complete, with animation + shadow)

image_speed = 0;
h_speed = 0;
v_speed = 0;
walking_speed = 2;
is_moving = false;
walk_spr = spr_playceholder_walk;
idle_spr = spr_playceholder_idle;
local_frame = 0;

// Walk-bounce animation state
anim_timer = 0;
y_offset = 0;

// Drop shadow sprite reference (for the pseudo-3D look)
shadow_spr = spr_player_shadow;

/// Tests the player's small foot-level collision box against casino furniture.
position_is_blocked = function(_x, _y) {
    if (!variable_global_exists("casino_solids")) return false;
    var _left   = _x - 6;
    var _right  = _x + 6;
    var _top    = _y - 15;
    var _bottom = _y - 1;
    for (var _i = 0; _i < array_length(global.casino_solids); _i++) {
        var _r = global.casino_solids[_i];
        if (_right > _r[0] && _left < _r[2] && _bottom > _r[1] && _top < _r[3]) {
            return true;
        }
    }
    return false;
};




