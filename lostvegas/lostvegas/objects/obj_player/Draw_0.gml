draw_sprite(shadow_spr, 0, x, y);

var _old_y = y;
y += y_offset;
draw_self();
y = _old_y;














