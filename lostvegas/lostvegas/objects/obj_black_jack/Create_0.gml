/// @description Insert description here
enum BLACK_JACK {
	DEAL,
	BETTING,
	PLAYER,
	DEALER,
	WAITING,
	RESOLVE,
	RESET,
}

numeral_limit = 21

result_text = ""

shuffle_timer = 0;

state = BLACK_JACK.BETTING

player_hand = []
dealer_hand = []

deck = []
for (var _i = 0; _i < 52; _i++)
{
	array_push(deck, _i);
	//array_shuffle_ext(deck);
}
array_shuffle_ext(deck);



















