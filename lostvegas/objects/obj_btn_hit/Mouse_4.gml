/// @description Insert description here
// You can write your code in this editor

if (obj_black_jack.state == BLACK_JACK.PLAYER)
{
	scr_deal_card(obj_black_jack.player_hand);
	
	if (scr_get_card_scores(obj_black_jack.player_hand) > 21)
	{
		obj_black_jack.state = BLACK_JACK.RESOLVE
	}
}

















