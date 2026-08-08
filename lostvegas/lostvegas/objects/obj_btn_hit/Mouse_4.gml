/// @description Insert description here
// You can write your code in this editor

if (obj_black_jack.state == BLACK_JACK.PLAYER)
{
	scr_deal_card(obj_black_jack.player_hand);
	
	if (scr_get_card_scores(obj_black_jack.player_hand) > 21)
	{
		with (obj_black_jack){
			scr_determine_winner();
			obj_black_jack.state = BLACK_JACK.RESOLVE
		}
	}
	image_index = 1
}

//reset
else if (obj_black_jack.state == BLACK_JACK.RESOLVE)
{
	obj_black_jack.state = BLACK_JACK.RESET;
	image_index = 1
}















