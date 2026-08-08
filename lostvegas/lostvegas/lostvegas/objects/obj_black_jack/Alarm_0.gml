/// @description Insert description here
var _dealer_score = scr_get_card_scores(dealer_hand);

if (_dealer_score < 17) 
{
	scr_deal_card(dealer_hand); //give card
	
	if (scr_get_card_scores(dealer_hand) <= 21) //cutoff
	{
		alarm[0] = game_get_speed(gamespeed_fps) * 0.8;
	} else {
		state = BLACK_JACK.RESOLVE;
	}
} else {
	state = BLACK_JACK.RESOLVE;
}




















