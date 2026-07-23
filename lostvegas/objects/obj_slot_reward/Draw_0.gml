/// @description Insert description here
// You can write your code in this editor
if (sprite_index != -1){
	draw_self();
	draw_text(x-sprite_width/2, y-42, "You Win!" )
}
if (no_luck == true){
	draw_text(x-sprite_width/2, y-42, "Too Bad!")
}
draw_text(x-sprite_width/2, y, "$" + string(string_format(global.money,1, 2) + "\nPress\n\"Enter\"\nto Leave"))



















