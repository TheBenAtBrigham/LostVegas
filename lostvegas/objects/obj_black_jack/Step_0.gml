/// @description Insert description here
if (obj_minigame_manager.rigged = true){
	numeral_limit = 11;
}
else {
	numeral_limit = 21;
}


switch (state) 
{

	case BLACK_JACK.BETTING: 
		//press space to deal
		if (global.card_bets > 0 && keyboard_check_pressed(vk_space))
		{
			state = BLACK_JACK.DEAL
		}
		break;
	
	case BLACK_JACK.DEAL:
		scr_deal_card(player_hand);
		scr_deal_card(dealer_hand);
		scr_deal_card(player_hand);
		scr_deal_card(dealer_hand);
		
		if (scr_get_card_scores(player_hand, numeral_limit)==numeral_limit){
			state = BLACK_JACK.DEALER
		} else {
			state = BLACK_JACK.PLAYER
		}
		break;
	
	
	
	case BLACK_JACK.PLAYER:
		if (scr_get_card_scores(player_hand, numeral_limit) > numeral_limit) 
		{
			scr_determine_winner(numeral_limit);
			state = BLACK_JACK.RESOLVE;
		}
		break;
	
	case BLACK_JACK.DEALER:
		alarm[0] = game_get_speed(gamespeed_fps) * 0.8;
		state = BLACK_JACK.WAITING;
		break;
	case BLACK_JACK.WAITING:
		break
	
	case BLACK_JACK.RESOLVE:
		//scr_determine_winner();
		if (keyboard_check_pressed(vk_space)){
			state=BLACK_JACK.RESET;
		}
		break;
	case BLACK_JACK.RESET:
		player_hand = [];
		dealer_hand = [];
		result_text = "";
		
		
		if (array_length(deck) < 20)
		{
			// Rebuild a standard 52-card deck. array_push requires both
			// the destination array and the card value being appended.
			deck = [];
			for (var _i = 0; _i < 52; _i++) {
				array_push(deck, _i);
			}
			array_shuffle_ext(deck);
			
			//shuffle_timer = game_get_speed(gamespeed_fps) * 2
		}
		
		
		state = BLACK_JACK.BETTING;
		break;
}

if (shuffle_timer > 0)
{
	shuffle_timer--
}



















