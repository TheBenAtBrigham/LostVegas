/// @description Insert description here
switch (state) 
{
	case BLACK_JACK.DEAL:
		scr_deal_card(player_hand);
		scr_deal_card(dealer_hand);
		scr_deal_card(player_hand);
		scr_deal_card(dealer_hand);
		
		if (scr_get_card_scores(player_hand)==21){
			state = BLACK_JACK.DEALER
		} else {
			state = BLACK_JACK.PLAYER
		}
		
	break;
	
	case BLACK_JACK.PLAYER:
	if (scr_get_card_scores(player_hand) > 21) 
	{
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
		state=BLACK_JACK.RESET;
		break;
	case BLACK_JACK.RESET:
		player_hand = [];
		dealer_hand = [];
		deck = [];
		for (var _i = 0; _i < 52; _i++){array_push(deck, _i);}
		array_shuffle_ext(deck);
		state = BLACK_JACK.DEAL;
		break;
}




















