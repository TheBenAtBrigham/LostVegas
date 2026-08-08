/// @description Insert description here
// You can write your code in this editor

if (object_exists(obj_player)) && (position_meeting(obj_player.x, obj_player.y, id))
{
	global.target_room = room_target;
	global.target_x = x_target;
	global.target_y = y_target;
	global.target_direction = obj_player.direction;
	room_goto(room_target);
	instance_destroy();
}


















