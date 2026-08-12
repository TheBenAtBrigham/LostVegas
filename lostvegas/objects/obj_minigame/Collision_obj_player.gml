/// obj_minigame: Collision with obj_player
/// Stores the casino return point, then enters the selected mini-game.

// UI input must not leak into room transitions.
if (instance_exists(obj_game_manager)
    && (obj_game_manager.dialogue_active
        || obj_game_manager.inventory_open
        || obj_game_manager.pause_open)) exit;

if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("E"))) {
    global.target_x = obj_player.x;
    global.target_y = obj_player.y;
    global.target_direction = obj_player.direction;
    global.minigame_session_counted = false;

    switch (state) {
        case MINIGAME.SLOTS: room_goto(rm_slots); break;
        case MINIGAME.CARDS: room_goto(rm_cards); break;
        case MINIGAME.ROULETTE: room_goto(rm_roulette); break;
    }
}






