/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_space){
	if state = MINIGAME.SLOTS{
		global.minigame_session_counted = false;
		room_goto(rm_slots)
	}
	if state = MINIGAME.CARDS
	{
		global.minigame_session_counted = false;
		room_goto(rm_cards)
	}
}






