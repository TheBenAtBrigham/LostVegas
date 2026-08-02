/// FILE: obj_title / Step event

blink_timer++;
if (blink_timer >= 30) {
    blink_timer = 0;
    show_prompt = !show_prompt;
}

// Any key advances past the title screen into the casino.
if (keyboard_check_pressed(vk_anykey)) {
    room_goto(casino);
}
