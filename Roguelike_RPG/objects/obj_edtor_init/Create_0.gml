global.selected_cell = undefined
global.current_button = undefined
global.width = get_integer("Enter width of the room", 10);
global.height = get_integer("Enter height of the room", 10);
for (i = 0; i < global.width; i++) {
	for (j = 0; j < global.height; j++) {
		instance_create_depth(i * 32, j * 32, 0, obj_editor_cell);
	}
}