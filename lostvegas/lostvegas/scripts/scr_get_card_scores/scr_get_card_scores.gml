// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_get_card_scores(_target_hand){
	var _total_score = 0;
	var _ace_count = 0;
	
	for (var _i = 0; _i < array_length(_target_hand); _i++)
	{
		//Card id (0-53)
		var _card_value = _target_hand[_i] % 13;
		
		if (_card_value == 0) 
		{
			_ace_count++
			_total_score+=11;
		} else if (_card_value >= 9) {
			_total_score+=10;
		} else {
			_total_score += (_card_value + 1);
		}
		
	}
	
	while (_total_score > 21 && _ace_count > 0)
	{
		_total_score -=10;
		_ace_count --;
	}
	return _total_score;
	
}
