// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_determine_winner(_limit){
	var _p_score = scr_get_card_scores(player_hand, _limit);
	var _d_score = scr_get_card_scores(dealer_hand, 21);
	
	//player busted
	if (_p_score > 21)
	{
		result_text = "Busted, Too Bad! ";
		global.card_bets = 0;
	}
	//player wins
	else if (_d_score > 21 || _p_score > _d_score)
	{
		if (_p_score == _limit && array_length(player_hand) == 2)
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
		audio_play_sound(snd_kaching, 100, false);
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
		audio_play_sound(snd_kaching, 100, false);
	}
	
	global.total_wins += 1;
}