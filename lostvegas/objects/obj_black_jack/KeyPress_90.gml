/// @description Hit
if (state == BLACK_JACK.PLAYER)
{
	scr_deal_card(player_hand);
	
	if (scr_get_card_scores(player_hand,numeral_limit) > numeral_limit)
	{
		scr_determine_winner(numeral_limit);
		state = BLACK_JACK.RESOLVE
	}
}




















