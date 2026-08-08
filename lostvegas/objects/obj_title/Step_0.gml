/// FILE: obj_title / Step event

blink_timer++;
if (blink_timer >= 30) {
    blink_timer = 0;
    show_prompt = !show_prompt;
}

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)) {
    menu_selected = 1 - menu_selected;
}

if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
    if (menu_selected == 0) {
        if (load_game_state()) {
            room_goto(global.target_room);
        }
        else {
            status_text = "No valid save. Choose NEW GAME.";
            save_available = false;
        }
    }
    else {
        begin_new_game();
        room_goto(casino);
    }
}
