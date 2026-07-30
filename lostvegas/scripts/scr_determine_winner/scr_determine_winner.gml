// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_determine_winner(){
	var _p_score = scr_get_card_scores(player_hand);
	var _d_score = scr_get_card_scores(dealer_hand);
	
	//player busted
	if (_p_score > 21)
	{
		result_text = "Busted, Too Bad! ";
		global.card_bets = 0;
	}
	//player wins
	else if (_d_score > 21 || _p_score > _d_score)
	{
		if (_p_score == 21 && array_length(player_hand) == 2)
		{
			result_text = "You Win! Pays 3:2";
			global.money += global.card_bets + (global.card_bets * 1.5)
		}
		else 
		{
			if (_d_score > 21)
			{
				result_text = "You Win! Dealer Busted";
			}
			else 
			{
				result_text = "You Win!"
			}
			global.money += (global.card_bets * 2);
			
		}
		global.card_bets = 0;
	}
	//dealer wins
	else if (_d_score > _p_score)
	{
		result_text = "Too Bad!"
		global.card_bets = 0;
	}
	
	//tie
	else if (_p_score == _d_score)
	{
		result_text = "Tie! Bet returned"
		global.money += global.card_bets;
		global.card_bets = 0;
	}
}