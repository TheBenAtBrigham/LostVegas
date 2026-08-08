/// @description Insert description here
// You can write your code in this editor
if (variable_global_exists("spins")){
	if (room == rm_slots && !obj_slot_1.finished_rotating && global.spins> 0) 
	{
		audio_play_sound(snd_slot, 100, false)
	}
}















