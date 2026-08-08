/// @description Insert description here
var _dealer_score = scr_get_card_scores(dealer_hand,numeral_limit);

if (_dealer_score < 17 && array_length(deck) > 0) 
{
	scr_deal_card(dealer_hand); //give card
	
	if (scr_get_card_scores(dealer_hand, numeral_limit) <= numeral_limit) //cutoff
	{
		alarm[0] = game_get_speed(gamespeed_fps) * 0.8;
	} else {
		scr_determine_winner(numeral_limit);
		state = BLACK_JACK.RESOLVE;
	}
} else {
	scr_determine_winner(numeral_limit);
	state = BLACK_JACK.RESOLVE;
}






















