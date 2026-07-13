/// @description Insert description here
// You can write your code in this editor

var _left_key = keyboard_check(vk_left);
var _right_key = keyboard_check(vk_right);
var _up_key = keyboard_check(vk_up);
var _down_key = keyboard_check(vk_down);
var _action_key = keyboard_check_pressed(vk_space);
var _select_key = keyboard_check_pressed(vk_shift);

input_direction = point_direction(0, 0, _right_key - _left_key, _down_key-_up_key);
//To prevent conflicting input
input_magnitude = (_right_key - _left_key != 0) || (_down_key - _up_key != 0);
//Our movement
h_speed = lengthdir_x(input_magnitude * walking_speed, input_direction)
v_speed = lengthdir_y(input_magnitude * walking_speed, input_direction)

x += h_speed;
y += v_speed;

// update sprite index
var _old_sprite = sprite_index;
if (input_magnitude != 0)
{
	direction = input_direction;
	sprite_index = walk_spr;
} else sprite_index = idle_spr;
if (_old_sprite != sprite_index) local_frame = 0;

//update image index
player_anim_script();



