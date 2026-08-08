/// Initialize cross-room coordinates once without overwriting loaded data.
if (instance_number(obj_init_machine) > 1) {
    instance_destroy();
    exit;
}

if (!variable_global_exists("target_room")) global.target_room = -1;
if (!variable_global_exists("target_x")) global.target_x = -1;
if (!variable_global_exists("target_y")) global.target_y = -1;
if (!variable_global_exists("target_direction")) global.target_direction = 90;




















