/// @description Insert description here
// You can write your code in this editor
slice_message = "";
if (!spinning && can_bet)
{
	var _mx = mouse_x;
	var _my = mouse_y;	
	
	var _cycle_bet = function(_current_val, _wallet)
	{
		audio_play_sound(snd_slot, 100, false);
		var _next_val = _current_val;
		var _loops = 0;
		while (_loops < 6) {
			_loops++
			switch (_next_val)
			{
				case 0: _next_val = 1; break;
				case 1: _next_val = 5; break;
				case 5: _next_val = 10; break;
				case 10: _next_val = 25; break;
				case 25: _next_val = 75; break;
				case 75: _next_val = 100; break;
				case 100: _next_val = 0; break;
				default: _next_val = 0; break;
			}
			if (_next_val ==0) return 0;
			
			var _cost = _next_val - _current_val;
			
			if (_wallet >= _cost) return _next_val;
		}
		return 0;
	};
	
	//Row with green 0
	if (_mx >= sqx1 && _mx <= sqx1 + (3 * sqsz) && _my >= sqy1 && _my <= sqy1 + sqsz)
	{
		var _old = number_bets[0];
		var _new = _cycle_bet(_old, global.money);
		var _diff = _new - _old;
		
		if (global.money >= _diff){
		
			global.money -= _diff;
			global.roulette_bets += _diff;
			number_bets[0] = _new;
		}
		exit;
	}
	
	//rows 2 to 4 ~ 1-9
	for (var _row = 0; _row < 3; _row++)
	{
		var _row_y = sqy1 + ((1 + _row) * sqsz);
		if (_my >= _row_y && _my <= _row_y + sqsz)
		{
			for (var _col = 0; _col < 3; _col++)
			{
				var _col_x = sqx1 + (_col * sqsz);
				if (_mx > _col_x && _mx < _col_x + sqsz)
				{
					var _clicked_num = 1+ (_row * 3) + _col
					var _old = number_bets[_clicked_num];
					var _new = _cycle_bet(_old, global.money);
		
					if (global.money >= (_new - _old))
					{
						global.money -= (_new - _old);
						global.roulette_bets += (_new - _old);
						number_bets[_clicked_num] = _new;
					}
					exit;
					
					
					
					//var _clicked_num = 1+ (_row * 3) + _col;
					//number_bets[_clicked_num] += chip_value;
					//global.roulette_bets += chip_value;
				}
			}
		}
	}
	
	//row 5 ~ 10 and 11
	var _row_5_y = sqy1 + (4 * sqsz)
	if (_my >= _row_5_y &&  _my <= _row_5_y + sqsz)
	{
		var _mid_x = sqx1 + (1.5 * sqsz) 
		//10
		if (_mx >= sqx1 && _mx <= _mid_x)
		{
			var _old = number_bets[10];
			var _new = _cycle_bet(_old, global.money);
		
			if (global.money >= (_new - _old))
			{
				global.money -= (_new - _old);
				global.roulette_bets += (_new - _old);
				number_bets[10] = _new;
			}
			exit;
			//number_bets[10] += chip_value;
			//global.roulette_bets += chip_value;
			
		}
		//11
		if ( _mx >= _mid_x && _mx <= sqx1 + (3 * sqsz))
		{
			var _old = number_bets[11];
			var _new = _cycle_bet(_old, global.money);
		
			if (global.money >= (_new - _old))
			{
				global.money -= (_new - _old);
				global.roulette_bets += (_new - _old);
				number_bets[11] = _new;
			}
			exit;
			//number_bets[11] += chip_value;
			//global.roulette_bets += chip_value;
		}
	}

	//row 6 ~ red / black
	var _row_6_y = sqy1 + (5 * sqsz)
	if ((_my >= _row_6_y &&  _my <= _row_6_y + sqsz) && !obj_minigame_manager.rigged)
	{
		var _mid_x = sqx1 + (1.5 * sqsz) 
		//red
		if (_mx >= sqx1 && _mx <= _mid_x)
		{
			var _old = red_bet;
			var _new = _cycle_bet(_old, global.money);
		
			if (global.money >= (_new - _old))
			{
				global.money -= (_new - _old);
				global.roulette_bets += (_new - _old);
				red_bet = _new;
			}
			exit;
			//red_bet += chip_value;
			//global.roulette_bets += chip_value;
			
		}
		//black
		if ( _mx >= _mid_x && _mx <= sqx1 + (3 * sqsz))
		{
			var _old = black_bet;
			var _new = _cycle_bet(_old, global.money);
		
			if (global.money >= (_new - _old))
			{
				global.money -= (_new - _old);
				global.roulette_bets += (_new - _old);
				black_bet = _new;
			}
			exit;
			//black_bet += chip_value;
			//global.roulette_bets += chip_value;
		}
	}
}


















