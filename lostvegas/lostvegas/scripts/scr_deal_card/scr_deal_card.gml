function scr_deal_card(_target_hand){
	if (array_length(obj_black_jack.deck) <= 0){
	
		for (var _i=0; _i < 52; _i++)
		{
			array_push(obj_black_jack.deck, _i)
		}
		array_shuffle_ext(obj_black_jack.deck);
		 
		obj_black_jack.shuffle_timer = game_get_speed(gamespeed_fps) * 2
	}
	//pull first card
	var _drawn_card = obj_black_jack.deck[0];
		
	//delete so it can't be pulled again
	array_delete(obj_black_jack.deck, 0, 1);
		
	//push into hand
	array_push(_target_hand, _drawn_card);

}