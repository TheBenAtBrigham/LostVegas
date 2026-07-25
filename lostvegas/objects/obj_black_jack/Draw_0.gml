/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);

draw_text(50, 50, "Player Score: " + string(scr_get_card_scores(player_hand)));
draw_text(50, 100, "Dealer Score: " + string(scr_get_card_scores(dealer_hand)));
draw_text(50, 150, "Game State " + string(state))
draw_text(50, 200, "Cards Left in Deck: " + string(array_length(deck)));
draw_text(50, 250, "Your Money: $" + string(string_format(global.money,1, 2)))
draw_text(50, 300, "Bets: $" + string(string_format(global.card_bets,1, 2)))



var _card_spacing = 32;
var _start_x = 350;
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

}












