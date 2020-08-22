filename = get_open_filename("*.room", "file")
file = file_text_open_read(filename)

for (i = 0; i < global.width; i++) {
	for (j = 0; j < global.height; j++) {
		position_destroy(i * 32, j * 32)
	}
}

global.width = file_text_read_real(file)
file_text_readln(file)
global.height = file_text_read_real(file)
file_text_readln(file)

for (i = 0; i < global.width; i++) {
	for (j = 0; j < global.height; j++) {
		instance_create_depth(i * 32, j * 32, 0, obj_editor_cell)
	}
}

while (!file_text_eof(file)) {
	obj_name = file_text_read_string(file)
	file_text_readln(file)
	obj_x = file_text_read_real(file)
	file_text_readln(file)
	obj_y = file_text_read_real(file)
	file_text_readln(file)
	obj = undefined
	switch (obj_name) {
		case "obj_wall": {
			obj = obj_wall
			break;
		}
		case "obj_door": {
			obj = obj_door
			break;
		}
		case "obj_rock": {
			obj = obj_rock
			break;
		}
		case "obj_enemy": {
			obj = obj_enemy
			break;
		}
	}
	if (obj != undefined) {
		instance_create_depth(obj_x * 32, obj_y * 32, 0, obj)
	}
}

file_text_close(file)