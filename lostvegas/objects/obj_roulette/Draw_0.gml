/// @description Insert description here
// You can write your code in this editor

draw_self();

//draw_set_valign(fa_middle);
//draw_set_halign(fa_center); no time to recenter everything

draw_text(x,y,slice_message)


draw_sprite(spr_roul_arrow, 0, x, y - 150)



draw_text(sqx1 - sqsz, sqy1, string(global.roulette_bets))
draw_text(sqx1 - sqsz, sqy1 - sqsz, "Your money: " + string(global.money))


draw_set_color(c_white)

//0
draw_rectangle(sqx1, sqy1, sqx2 + (2 * sqsz), sqy2, true);
//draw_text(sqx1 + (1.5 * sqsz), sqy1 + (0.5 * sqsz) - (0.5 * sqsz), "0");
draw_sprite(spr_board, 0, sqx1 + (1.5 * sqsz), sqy1 + (0.5 * sqsz))
if (number_bets[0] > 0) 
{
	draw_text(sqx1 + (1.5 * sqsz), sqy1 + (0.5 * sqsz), "$" + string(number_bets[0]))
	draw_sprite(spr_chips, 1, sqx1 + (1.5 * sqsz), sqy1 + (0.5 * sqsz))
}
//1-9
for (var _row = 0; _row < 3; _row++)
{
	for (var _col = 0; _col < 3; _col++)
	{
		var _x1 = sqx1 + (_col * sqsz);
		var _y1 = sqy1 + ((1 + _row) * sqsz);
		var _num = 1 + (_row * 3) + _col;
		draw_rectangle(_x1, _y1, _x1 + sqsz, _y1 + sqsz, true);
		draw_sprite(spr_board, _num, _x1 + (sqsz / 2), _y1 + (sqsz / 2));
		
		
		if (number_bets[_num] > 0)
		{
			draw_text(_x1 + (sqsz / 2), _y1 + (sqsz / 2), "$" + string(number_bets[0]))
			draw_sprite(spr_chips, 1, _x1 + (sqsz / 2), _y1 + (sqsz / 2));
		}
	}
}


//10-11
var _r5y = sqy1 + (4 * sqsz)
draw_rectangle(sqx1, _r5y, sqx2 + (sqsz / 2), _r5y + sqsz, true);
draw_sprite(spr_board, 10, sqx1 + (sqsz * 0.75), _r5y + (sqsz / 2) );
if (number_bets[10] > 0)
{
	draw_sprite(spr_chips, 1, sqx1 + (sqsz * 0.75), _r5y + (sqsz / 2))
}

draw_rectangle(sqx1 + (sqsz * 1.5), _r5y, sqx2 + (2 * sqsz), _r5y + sqsz, true);
draw_sprite(spr_board, 11, sqx1 + (sqsz * 1.5) + (sqsz * 0.75), _r5y + (sqsz / 2) );
if (number_bets[11] > 0)
{
	draw_sprite(spr_chips, 1, sqx1 + (sqsz * 1.5) + (sqsz * 0.75), _r5y + (sqsz / 2) )
}

var _r6y = sqy1 + (5 * sqsz)
draw_rectangle(sqx1, _r6y, sqx2 + (sqsz / 2), _r6y + sqsz , true);
draw_sprite(spr_board, 12, sqx1 + (sqsz * 0.75), _r6y + (sqsz / 2));
if (red_bet > 0)
{
	draw_sprite(spr_chips, 1, sqx1 + (sqsz * 0.75), _r6y + (sqsz / 2));
}

draw_rectangle(sqx1 + (sqsz / 2) + sqsz, _r6y, sqx2 + (2 * sqsz), sqy2 + (5 * sqsz), true);
draw_sprite(spr_board, 13, sqx1 + sqsz + (sqsz / 2) + (sqsz * 0.75), _r6y + (sqsz / 2));
if (black_bet > 0)
{
	draw_sprite(spr_chips, 1, sqx1 + sqsz + (sqsz / 2) + (sqsz * 0.75), _r6y + (sqsz / 2));
}








