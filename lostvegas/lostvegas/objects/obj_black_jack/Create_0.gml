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

results = ""


state = BLACK_JACK.DEAL

player_hand = []
dealer_hand = []

deck = []
for (var _i = 0; _i < 52; _i++)
{
	array_push(deck, _i);
	
	array_shuffle_ext(deck);
}



















