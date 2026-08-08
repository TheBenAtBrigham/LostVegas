/// @description Insert description here
// You can write your code in this editor
if (room != casino)
{
	
	if ((!variable_global_exists("minigame_session_counted") || !global.minigame_session_counted)) {
		global.minigames_played += 1;
		global.minigame_session_counted = true;
	}
	if (instance_exists(obj_player))
	{
		with (obj_player){
		global.target_x = x;
		global.target_y = y;
		global.target_direction = direction;
		}
	}
	room_goto(casino);
	
}



















