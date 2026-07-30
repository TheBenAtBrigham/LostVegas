/// Enter a playable casino game without allowing dialogue input to leak through.
if (instance_exists(obj_game_manager) && obj_game_manager.dialogue_active) exit;

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"))) {
	if (state == MINIGAME.SLOTS) {
		global.minigame_session_counted = false;
		room_goto(rm_slots);
	}
	else if (state == MINIGAME.CARDS) {
		room_goto(rm_cards);
		// rm_cards is still an empty prototype, so keep the player in the casino.
		/*if (instance_exists(obj_game_manager)) {
			obj_game_manager.start_dialogue(
				["DEALER", "MARA"],
				[
					"This table is closed. Management says the cards are being counted.",
					"Then the slot banks are my only playable lead."
				]
			);
			obj_game_manager.objective_text = "Try a slot bank on either side of the casino.";
		}*/
	}
	if (state == MINIGAME.ROULETTE) {
		//room_goto(rm_roulette);
	}
}






