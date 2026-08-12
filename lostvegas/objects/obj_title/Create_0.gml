/// obj_title: Create
/// Detects save availability and prepares the title-menu selection.

blink_timer = 0;
show_prompt = true;
menu_options = ["CONTINUE", "NEW GAME"];
save_available = save_file_exists();
menu_selected = save_available ? 0 : 1;
status_text = save_available ? "Save data found" : "No save data found";
