/// File-backed save/load helpers. Relative paths resolve inside GameMaker's save area.

function save_file_exists() {
    return file_exists("lostvegas_save.ini");
}

function save_game_state(_player_x, _player_y, _player_direction, _room_id) {
    ini_open("lostvegas_save.ini");

    ini_write_real("meta", "version", 1);
    ini_write_string("meta", "saved_at", date_datetime_string(date_current_datetime()));

    ini_write_real("player", "x", _player_x);
    ini_write_real("player", "y", _player_y);
    ini_write_real("player", "direction", _player_direction);
    ini_write_real("player", "money", global.money);
    ini_write_string("player", "room", room_get_name(_room_id));

    ini_write_real("story", "stage", global.story_stage);
    ini_write_real("story", "minigames_played", global.minigames_played);
    ini_write_real("story", "slots_played", global.slots_played);
    ini_write_real("story", "saw_locked_exit", global.saw_locked_exit);
    ini_write_real("story", "found_planter_note", global.found_planter_note);
    ini_write_real("story", "found_cashier_clue", global.found_cashier_clue);
    ini_write_real("story", "found_service_badge", global.found_service_badge);
    ini_write_real("story", "escape_open", global.escape_open);

    var _inventory_count = array_length(global.inventory);
    ini_write_real("inventory", "count", _inventory_count);
    ini_write_real("inventory", "selected", global.inventory_selected);
    for (var _i = 0; _i < _inventory_count; _i++) {
        ini_write_string("inventory", "item_" + string(_i), global.inventory[_i]);
    }

    ini_close();
    return true;
}

function load_game_state() {
    if (!save_file_exists()) return false;

    ini_open("lostvegas_save.ini");
    var _version = ini_read_real("meta", "version", 0);
    if (_version != 1) {
        ini_close();
        return false;
    }

    global.story_initialized = true;
    global.loaded_from_save = true;
    global.money = ini_read_real("player", "money", 50);
    global.target_x = ini_read_real("player", "x", 320);
    global.target_y = ini_read_real("player", "y", 326);
    global.target_direction = ini_read_real("player", "direction", 90);
    var _saved_room = ini_read_string("player", "room", "casino");
    switch (_saved_room) {
        case "rm_main_stairs": global.target_room = rm_main_stairs; break;
        default: global.target_room = casino; break;
    }

    global.story_stage = ini_read_real("story", "stage", 0);
    global.minigames_played = ini_read_real("story", "minigames_played", 0);
    global.slots_played = ini_read_real("story", "slots_played", false);
    global.minigame_session_counted = false;
    global.saw_locked_exit = ini_read_real("story", "saw_locked_exit", false);
    global.found_planter_note = ini_read_real("story", "found_planter_note", false);
    global.found_cashier_clue = ini_read_real("story", "found_cashier_clue", false);
    global.found_service_badge = ini_read_real("story", "found_service_badge", false);
    global.escape_open = ini_read_real("story", "escape_open", false);

    global.inventory = [];
    var _inventory_count = max(0, floor(ini_read_real("inventory", "count", 0)));
    for (var _i = 0; _i < _inventory_count; _i++) {
        var _item_id = ini_read_string("inventory", "item_" + string(_i), "");
        if (_item_id != "") array_push(global.inventory, _item_id);
    }
    global.inventory_selected = clamp(
        ini_read_real("inventory", "selected", 0),
        0,
        max(0, array_length(global.inventory) - 1)
    );

    ini_close();
    return true;
}

function begin_new_game() {
    global.story_initialized = false;
    global.loaded_from_save = false;
    global.inventory = [];
    global.inventory_selected = 0;
    global.target_room = casino;
    global.target_x = -1;
    global.target_y = -1;
    global.target_direction = 90;
}
