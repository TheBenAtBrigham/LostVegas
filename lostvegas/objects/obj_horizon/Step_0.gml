/// @description Insert description here
// You can write your code in this editor
if (object_exists(obj_player)) && (position_meeting(obj_player.x, obj_player.y, id))
{
	global.target_room = room_target;
	room_goto(room_target);
	instance_destroy();
}



















