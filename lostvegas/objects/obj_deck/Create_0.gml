/// @description Insert description here
// You can write your code in this editor

{
	deck = ds_list_create();
	
	
	cards_in_deck = 55;
	
	for (var _i=0; _i <  cards_in_deck; ++_i)
	{
		ds_list_add(deck, _i);
	}
	randomize()
	ds_list_shuffle(deck)
}


















