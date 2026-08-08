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
		
		slice_message = string(_winning_shot) + " is the winning shot";
	}
	

}





















