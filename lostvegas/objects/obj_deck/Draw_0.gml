/// @description Insert description here
// You can write your code in this editor
{
	for(var _i=0; _i<cards_in_deck; ++_i)
	{
		draw_sprite(spr_cards, deck[|_i], x+ (30*_i),y );
		draw_set_color(c_orange)
		draw_text(x+(30*_i)+5, y+10, deck[|_i])
	}
}



















