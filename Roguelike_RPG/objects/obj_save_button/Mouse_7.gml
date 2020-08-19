filename = get_string("Enter file name:", "file.room")
file = file_text_open_write(working_directory + "/" + filename)
file_text_write_real(file, global.width)
file_text_writeln(file)
file_text_write_real(file, global.height)
file_text_writeln(file)
for (i = 0; i < global.width; i++) {
	for (j = 0; j < global.height; j++) {
		environ = instance_position(i * 32, j * 32, obj_environment)
		if (environ != noone) {
			need_save = true
			switch (environ.object_index) {
				case obj_wall: {
					file_text_write_string(file, "obj_wall")
					file_text_writeln(file)
					break;
				}
				case obj_door: {
					file_text_write_string(file, "obj_door")
					file_text_writeln(file)
					break;
				}
				case obj_rock: {
					file_text_write_string(file, "obj_rock")
					file_text_writeln(file)
					break;
				}
				case obj_enemy: {
					file_text_write_string(file, "obj_enemy")
					file_text_writeln(file)
					break;
				}
				default: {
					need_save = false
				}
			}
			if (need_save) {
				file_text_write_real(file, i)
				file_text_writeln(file)
				file_text_write_real(file, j)
				file_text_writeln(file)
			}
		}
	}
}
file_text_close(file)