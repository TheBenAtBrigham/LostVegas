/// @description Insert description here
// You can write your code in this editor
if (room != casino)
{
	if (!variable_global_exists("minigame_session_counted") || !global.minigame_session_counted) {
		global.minigames_played += 1;
		global.minigame_session_counted = true;
	}
	room_goto(casino);
}



















