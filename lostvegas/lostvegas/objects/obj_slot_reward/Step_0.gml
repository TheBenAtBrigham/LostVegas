/// @description Insert description here
// You can write your code in this editor

if (obj_slot_1.finished_rotating and obj_slot_2.finished_rotating and obj_slot_3.finished_rotating)
{
	if (obj_slot_1.y1 == obj_slot_2.y1 && obj_slot_1.y1 == obj_slot_3.y1) //3 way match
	{
		obj_slot_reward.sprite_index = ds_map_find_value(reward_map, obj_slot_1.y1);
		showing_reward = true; //show that reward
		if (obj_slot_1.y1 == 0 ){global.money += 1000 * global.slots_bets} //all 7s
		if (obj_slot_1.y1 == 66 && obj_minigame_manager.rigged = false)
		{
			global.money += 15
		} //all cherries
		if (obj_slot_1.y1 == 132 && obj_minigame_manager.rigged = false){global.money += 40 * global.slots_bets} //all spades
		if (obj_slot_1.y1 == 198 && obj_minigame_manager.rigged = false){global.money += 100 * global.slots_bets} //all gems
		if (obj_slot_1.y1 == 264 && obj_minigame_manager.rigged = false){global.money += 200 * global.slots_bets} //all dollar signs
		obj_slot_1.finished_rotating = false;
		obj_slot_2.finished_rotating = false;
		obj_slot_3.finished_rotating = false;
		no_luck = false;
	}
	else if (obj_slot_1.y1 == obj_slot_2.y1 && obj_slot_1.y1 == 66 && obj_minigame_manager.rigged = false) //2 cherries
	{
		obj_slot_reward.sprite_index = ds_map_find_value(reward_map, obj_slot_1.y1);
		showing_reward = true; //show that reward
		global.money += 5
		obj_slot_1.finished_rotating = false;
		obj_slot_2.finished_rotating = false;
		obj_slot_3.finished_rotating = false;
		no_luck = false;
	}
	else if (obj_slot_1.y1 == 66 && obj_minigame_manager.rigged = false) //1 cherry in first slot
	{
		obj_slot_reward.sprite_index = ds_map_find_value(reward_map, obj_slot_1.y1);
		showing_reward = true; //show that reward
		global.money += 2;
		global.spins += 1;
		extra_spin = true;
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
		global.spins -= 1;
		if (global.slots_bets > 0) global.slots_bets -= 1;
	}
	//global.total_wins +=1;
	global.slots_played = true;
}


















