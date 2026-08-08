/// @description Insert description here
draw_set_color(c_white);

draw_text(50, 50, "Player Score: " + string(scr_get_card_scores(player_hand, numeral_limit))+ "/" + (string(numeral_limit)));
draw_text(50, 100, "Dealer Score: " + string(scr_get_card_scores(dealer_hand, numeral_limit))+ "/21" /*+ (string(numeral_limit))*/);
draw_text(50, 150, "Game State " + string(state))
draw_text(50, 200, "Cards Left in Deck: " + string(array_length(deck)));
draw_text(50, 250, "Your Money: $" + string(string_format(global.money,1, 2)))
draw_text(50, 300, "Bets: $" + string(string_format(global.card_bets,1, 2)))




var _card_spacing = 32;
var _start_x = 370;
var _hand_y = 250;

var _total_cards = array_length(player_hand);

for (var _i = 0; _i < _total_cards; _i++;)
{
	var _target_x = _start_x - ((_total_cards - 1) * _card_spacing / 2) + (_i * _card_spacing)
	draw_sprite(spr_cards, player_hand[_i], _target_x, _hand_y)
}

var _dealer_cards = array_length(dealer_hand);

for (var _j = 0; _j < _dealer_cards; _j++) {
	var _target_x = _start_x - ((_dealer_cards - 1) * _card_spacing / 2) + (_j * _card_spacing);
	draw_sprite(spr_cards, dealer_hand[_j],_target_x, _hand_y - 200);
	
	//hide the second card
	if (_j == 1 && (state == BLACK_JACK.BETTING) || state == BLACK_JACK.DEAL || state == BLACK_JACK.PLAYER)
	{
		draw_sprite(spr_cards, 54, _target_x, _hand_y - 200);
	} else {
		draw_sprite(spr_cards, dealer_hand[_j], _target_x, _hand_y - 200);
	}
	
}

if (state == BLACK_JACK.BETTING)
{
	draw_set_color(c_yellow)
	draw_text(350, 200, "Make your bet, \nthen press 'space' \nto start");
}

if (state == BLACK_JACK.RESOLVE)
{
	//draw_set_halign(fa_center);
	//draw_set_valign(fa_middle);
	
	draw_text(350,150,string(result_text));
	draw_text(350, 200, "Press space or 'hit' to restart");
}

if (shuffle_timer > 0) 
{
	draw_text(350, 200, "Reshuffling");
}









