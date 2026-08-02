/// @description Hit
if (state == BLACK_JACK.PLAYER)
{
	scr_deal_card(player_hand);
	
	if (scr_get_card_scores(player_hand) > 21)
	{
		scr_determine_winner();
		state = BLACK_JACK.RESOLVE
	}
}




















