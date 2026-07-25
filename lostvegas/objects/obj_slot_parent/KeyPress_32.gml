/// @description Insert description here
// You can write your code in this editor
if (global.spins > 0){
if (obj_slot_reward.showing_reward || (!finished_rotating and !rolling)){
	alarm[0]= 2 + random_range(20,45); //45
	obj_slot_reward.extra_spin = false;
	rolling = true;
	run_speed = 7 + random(2); //2
	obj_slot_reward.no_luck = false;
	obj_slot_reward.showing_reward = false;
	obj_slot_reward.sprite_index = -1;
}
}


















