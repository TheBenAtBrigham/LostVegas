/// @description Rolling the roulette
slice_message = "";
if (global.roulette_bets > 0 && !spinning)
{
	spinning = true;
	
	var _target_num = irandom(11);
	
	var _target_index = 0;
	
	for (var _i = 0; _i < 12; _i++)
	{
		if (wheel_mapping[_i] == _target_num)
		{
			_target_index = _i;
			break;
		}
	}

	var _current_wrap = image_angle mod 360;
	if (_current_wrap < 0) _current_wrap += 360;
	
	var _absolute_dest = (needle_point - (_target_index * angles)) mod 360;
	if (_absolute_dest < 0) _absolute_dest += 360;
	
	var _relative_dist = _absolute_dest - _current_wrap;
	if (_relative_dist <= 0) _relative_dist += 360
	
	
	var _full_spins = 360 * irandom_range(4, 6);
	target_angle = image_angle + _relative_dist + _full_spins;
}


















