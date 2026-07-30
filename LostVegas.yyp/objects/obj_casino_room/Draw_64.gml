/// FILE: obj_casino_room / Draw GUI event (REPLACES the earlier simple version)
/// Shows current story state, stats, and a scrolling log of the last few
/// story transitions — much easier to verify sequencing during testing
/// than a single line that just shows the current state.

draw_set_alpha(0.75);
draw_set_colour(c_black);
draw_rectangle(4, 4, 260, 90, false);
draw_set_alpha(1);

draw_set_colour(c_white);
draw_text(10, 8,  "Story state: " + story_state_name());
draw_text(10, 24, "Total losses: " + string(global.total_losses));
draw_text(10, 40, "Credits: " + string(global.player_credits));

draw_set_colour(make_colour_rgb(200, 200, 200));
draw_text(10, 60, "Recent events:");

var _log_count = array_length(global.story_log);
var _show_count = min(_log_count, 3); // last 3 entries only, to keep the HUD compact
for (var _i = 0; _i < _show_count; _i++) {
    var _entry = global.story_log[_log_count - _show_count + _i];
    draw_text(10, 74 + (_i * 14), _entry);
}
