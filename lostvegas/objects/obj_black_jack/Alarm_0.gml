/// @description Insert description here
var _dealer_score = scr_get_card_scores(dealer_hand);

if (_dealer_score < 17 && array_length(deck) > 0) 
{
	scr_deal_card(dealer_hand); //give card
	
	if (scr_get_card_scores(dealer_hand) <= 21) //cutoff
	{
		alarm[0] = game_get_speed(gamespeed_fps) * 0.8;
	} else {
		scr_determine_winner();
		state = BLACK_JACK.RESOLVE;
	}
} else {
	scr_determine_winner();
	state = BLACK_JACK.RESOLVE;
}






















