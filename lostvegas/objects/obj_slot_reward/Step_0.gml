/// @description Insert description here
// You can write your code in this editor

if (obj_slot_1.finished_rotating and obj_slot_2.finished_rotating and obj_slot_3.finished_rotating)
{
	if (obj_slot_1.y1 == obj_slot_2.y1 && obj_slot_1.y1 == obj_slot_3.y1)
	{
		obj_slot_reward.sprite_index = ds_map_find_value(reward_map, obj_slot_1.y1);
		showing_reward = true; //show that reward
		if (obj_slot_1.y1 == 0 ){global.money += 500} //all 7s
		if (obj_slot_1.y1 == 66 && obj_minigame_manager.rigged = false){global.money += 300} //all cherries
		obj_slot_1.finished_rotating = false;
		obj_slot_2.finished_rotating = false;
		obj_slot_3.finished_rotating = false;
		no_luck = false;
	}
	else 
	{
		obj_slot_1.finished_rotating = false;
		obj_slot_2.finished_rotating = false;
		obj_slot_3.finished_rotating = false;
		no_luck = true;
	}
}


















