/// @description Insert description here
// You can write your code in this editor

if (spinning)
{
	image_angle = lerp(image_angle, target_angle, 0.03) //for slowing down
	
	if (abs(image_angle - target_angle) < 0.1)
	{
		image_angle = target_angle;
		spinning = false;
		
		var _final_angle = image_angle mod 360;
		if (_final_angle < 0) _final_angle += 360;
		
		var _winning_index = floor((((needle_point - _final_angle) + 360) mod 360) / angles);
		var _winning_shot = wheel_mapping[_winning_index];
		
		winning_number = _winning_shot;
		
		slice_message = string(_winning_shot) + " is the winning shot";
	}
}



if (slice_message != "")
{
	show_debug_message(winning_number)
	
	
	var _winnings = 0;
	_winnings += number_bets[winning_number] * 11;
	_winnings += number_bets[winning_number];
	
	var _winning_color = color_map[winning_number]
	
	if (_winning_color == 1)
	{
		_winnings += red_bet * 2
	}
	if (_winning_color == 2)
	{
		_winnings += black_bet * 2
	}
	
	if (_winnings != 0) 
	{
		audio_play_sound(snd_kaching, 100, false);
	}

	
	global.money += _winnings;
	
	number_bets = array_create(12, 0);
	red_bet = 0;
	black_bet =0;
	
	global.roulette_bets = 0;
	
	
	
}



















