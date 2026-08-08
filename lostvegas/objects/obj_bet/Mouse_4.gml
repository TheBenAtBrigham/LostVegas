/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_black_jack) && obj_black_jack.state == BLACK_JACK.BETTING)
{
	global.card_bets += 1;
	global.money -= 1;
	image_index = 1;
}
if (room == rm_slots)
{
	global.slots_bets += 1;
	global.spins += 1;
	global.money -= 1;
	image_index = 1;
}
if (room == rm_roulette)
{
	global.roulette_bets += 1;
	global.money -= 1;
	image_index = 1;
}

audio_play_sound(snd_btn, 100, false);




















