function scr_putObject(argument0, argument1, argument2) {
	file = argument0
	x0 = argument1
	x1 = argument2
	while (!file_text_eof(file)) {
		obj_name = file_text_read_string(file)
		file_text_readln(file)
		obj_x = file_text_read_real(file) + x0
		file_text_readln(file)
		obj_y = file_text_read_real(file) + y0
		file_text_readln(file)
		obj = undefined
		switch (obj_name) {
			case "obj_door":
			case "obj_wall": {
				obj = obj_wall
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
			case "obj_player": {
				obj = obj_player
				break;
			}
			case "obj_boss": {
				obj = obj_boss
				break;
			}
			case "obj_money": {
				obj = obj_money
				break
			}
			case "obj_shop": {
				obj = obj_shop
				break
			}
		}
		if (obj != undefined) {
			instance_create_depth(obj_x * 32, obj_y * 32, 0, obj)
		}
	}


}
