/// obj_player - Step event (FINAL)

var _left_key = keyboard_check(vk_left);
var _right_key = keyboard_check(vk_right);
var _up_key = keyboard_check(vk_up);
var _down_key = keyboard_check(vk_down);
var _action_key = keyboard_check_pressed(vk_space);
var _select_key = keyboard_check_pressed(vk_shift);

input_direction = point_direction(0, 0, _right_key - _left_key, _down_key - _up_key);

// To prevent conflicting input
input_magnitude = (_right_key - _left_key != 0) || (_down_key - _up_key != 0);

// Our movement
h_speed = lengthdir_x(input_magnitude * walking_speed, input_direction);
v_speed = lengthdir_y(input_magnitude * walking_speed, input_direction);

// Resolve each axis separately so the player slides naturally along furniture.
var _steps_x = ceil(abs(h_speed));
if (_steps_x > 0) {
    var _move_x = h_speed / _steps_x;
    repeat (_steps_x) {
        if (!position_is_blocked(x + _move_x, y)) x += _move_x; else break;
    }
}
var _steps_y = ceil(abs(v_speed));
if (_steps_y > 0) {
    var _move_y = v_speed / _steps_y;
    repeat (_steps_y) {
        if (!position_is_blocked(x, y + _move_y)) y += _move_y; else break;
    }
}

is_moving = (input_magnitude != 0);

// update sprite index
var _old_sprite = sprite_index;
if (input_magnitude != 0)
{
    direction = input_direction;
    sprite_index = walk_spr;
} else sprite_index = idle_spr;
if (_old_sprite != sprite_index) local_frame = 0;

// update image index
player_anim_script();
