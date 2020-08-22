files = []
files_number = scr_getFilesByMask(files, "usual*.room")
rooms_count = get_integer("Enter number of rooms", 4)
full_width = 0
full_height = 0
room_coords = []
for (i = 0; i < rooms_count; i++) {
	do {
		room_number = irandom_range(0, files_number - 1)
	} until (files[room_number] != undefined)
	file = file_text_open_read(files[room_number])
	files[room_number] = undefined
	width = file_text_read_real(file)
	file_text_readln(file)
	height = file_text_read_real(file)
	file_text_readln(file)
	x0 = full_width + 1
	y0 = full_height + 1
	found = false
	if (full_width > full_height) {
		for (y = 0; y <= full_height; y++) {
			for (x = 0; x <= full_width; x++) {
				found = true
				for (r = 0; r < i; r++) {
					if (x >= room_coords[r][0] && x <= room_coords[r][2] &&
						y >= room_coords[r][1] && y <= room_coords[r][3] ||
						x + width + 3 >= room_coords[r][0] && x + width + 3 <= room_coords[r][2] &&
						y + height + 3 >= room_coords[r][1] && y + height + 3 <= room_coords[r][3]) {
						x = max(x, room_coords[r][2])
						found = false
					}
				}
				if (found) {
					x0 = x
					y0 = y
					break
				}
			}
			if (found) break
		}
	} else {
		for (x = 0; x <= full_width; x++) {
			for (y = 0; y <= full_height; y++) {
				found = true
				for (r = 0; r < i; r++) {
					if (x >= room_coords[r][0] && x <= room_coords[r][2] &&
						y >= room_coords[r][1] && y <= room_coords[r][3] ||
						x + width + 3 >= room_coords[r][0] && x + width + 3 <= room_coords[r][2] &&
						y + height + 3 >= room_coords[r][1] && y + height + 3 <= room_coords[r][3]) {
						y = max(y, room_coords[r][3])
						found = false
					}
				}
				if (found) {
					x0 = x
					y0 = y
					break
				}
			}
			if (found) break
		}
	}
	full_width = max(x0 + width + 3, full_width)
	full_height = max(y0 + height + 3, full_height)
	room_coords[i] = [x0, y0, x0 + width + 3, y0 + width + 3]
	scr_putObject(file, x0, y0)
	file_text_close(file)
}

files = []
files_number = scr_getFilesByMask(files, "start*.room")
room_number = irandom_range(0, files_number - 1)
file = file_text_open_read(files[room_number])
width = file_text_read_real(file)
file_text_readln(file)
height = file_text_read_real(file)
file_text_readln(file)
x0 = -width - 3
y0 = -height - 3
room_coords[rooms_count] = [x0, y0, x0 + width + 3, y0 + width + 3]
rooms_count++
scr_putObject(file, x0, y0)
file_text_close(file)

files = []
files_number = scr_getFilesByMask(files, "start*.room")
room_number = irandom_range(0, files_number - 1)
file = file_text_open_read(files[room_number])
width = file_text_read_real(file)
file_text_readln(file)
height = file_text_read_real(file)
file_text_readln(file)
x0 = full_width
y0 = full_height
room_coords[rooms_count] = [x0, y0, x0 + width + 3, y0 + width + 3]
rooms_count++
scr_putObject(file, x0, y0)
file_text_close(file)

files = []
files_number = scr_getFilesByMask(files, "start*.room")
room_number = irandom_range(0, files_number - 1)
file = file_text_open_read(files[room_number])
width = file_text_read_real(file)
file_text_readln(file)
height = file_text_read_real(file)
file_text_readln(file)
if (full_width > full_height) {
	x0 = full_width
	y0 = 0
} else {
	x0 = 0
	y0 = full_height
}
room_coords[rooms_count] = [x0, y0, x0 + width + 3, y0 + width + 3]
rooms_count++
scr_putObject(file, x0, y0)
file_text_close(file)

files = []
files_number = scr_getFilesByMask(files, "start*.room")
room_number = irandom_range(0, files_number - 1)
file = file_text_open_read(files[room_number])
width = file_text_read_real(file)
file_text_readln(file)
height = file_text_read_real(file)
file_text_readln(file)
if (full_width > full_height) {
	x0 = 0
	y0 = full_height
} else {
	x0 = full_width
	y0 = 0
}
room_coords[rooms_count] = [x0, y0, x0 + width + 3, y0 + width + 3]
rooms_count++
scr_putObject(file, x0, y0)
file_text_close(file)

room_connections = []
connections_count = 0

for (i = 0; i < room_number; i++) {
	for (j = i; j < room_number; j++) {
		if (((room_coords[j][0] >= room_coords[i][0] && room_coords[j][0] <= room_coords[i][2]) || 
			(room_coords[j][2] >= room_coords[i][0] && room_coords[j][2] <= room_coords[i][2])) &&
			(room_coords[i][3] == room_coords[j][1] || room_coords[i][1] == room_coords[j][3]) ||
			((room_coords[j][1] >= room_coords[i][1] && room_coords[j][1] <= room_coords[i][3]) || 
			(room_coords[j][3] >= room_coords[i][1] && room_coords[j][3] <= room_coords[i][1])) &&
			(room_coords[i][2] == room_coords[j][0] || room_coords[i][0] == room_coords[j][2])) {
			room_connections[connections_count] = [i, j]
			connections_count++
		}
	}
}

for (i = 0; i < connections_count; i++) {
	room_size_prev = room_coords[room_connections[i][0]]
	room_size_next = room_coords[room_connections[i][1]]
	door_prev_coord = [0, 0]
	door_next_coord = [0, 0]
	if (room_size_prev[3] == room_size_next[1] || room_size_prev[1] == room_size_next[3]) {
		segment_begin = max(room_size_prev[0], room_size_next[0])
		segment_end = min(room_size_prev[2], room_size_next[2])
		door_prev_coord[0] = (segment_begin + segment_end) / 2
		door_next_coord[0] = (segment_begin + segment_end) / 2
		if (room_size_prev[3] == room_size_next[1]) {
			door_prev_coord[1] = room_size_prev[3] - 3
			door_next_coord[1] = room_size_next[1]
			while (instance_position(door_prev_coord[0] * 32, door_prev_coord[1] * 32, obj_wall) == noone) {
				door_prev_coord[1]--
			}
			while (instance_position(door_next_coord[0] * 32, door_next_coord[1] * 32, obj_wall) == noone) {
				door_next_coord[1]++
			}
		} else {
			door_prev_coord[1] = room_size_prev[1]
			door_next_coord[1] = room_size_next[3] - 3
			while (instance_position(door_prev_coord[0] * 32, door_prev_coord[1] * 32, obj_wall) == noone) {
				door_prev_coord[1]++
			}
			while (instance_position(door_next_coord[0] * 32, door_next_coord[1] * 32, obj_wall) == noone) {
				door_next_coord[1]--
			}
		}
	} else {
		segment_begin = max(room_size_prev[1], room_size_next[1])
		segment_end = min(room_size_prev[3], room_size_next[3])
		door_prev_coord[1] = (segment_begin + segment_end) / 2
		door_next_coord[1] = (segment_begin + segment_end) / 2
		if (room_size_prev[2] == room_size_next[0]) {
			door_prev_coord[0] = room_size_prev[2] - 3
			door_next_coord[0] = room_size_next[0]
			while (instance_position(door_prev_coord[0] * 32, door_prev_coord[1] * 32, obj_wall) == noone) {
				door_prev_coord[0]--
			}
			while (instance_position(door_next_coord[0] * 32, door_next_coord[1] * 32, obj_wall) == noone) {
				door_next_coord[0]++
			}
		} else {
			door_prev_coord[0] = room_size_prev[0]
			door_next_coord[0] = room_size_next[2] - 3
			while (instance_position(door_prev_coord[0] * 32, door_prev_coord[1] * 32, obj_wall) == noone) {
				door_prev_coord[1]++
			}
			while (instance_position(door_next_coord[0] * 32, door_next_coord[1] * 32, obj_wall) == noone) {
				door_next_coord[1]--
			}
		}
	}
	instance_destroy(instance_position(door_prev_coord[0] * 32, door_prev_coord[1] * 32, obj_wall))
	instance_create_depth(door_prev_coord[0] * 32, door_prev_coord[1] * 32, 0, obj_door)
	instance_destroy(instance_position(door_next_coord[0] * 32, door_next_coord[1] * 32, obj_wall))
	instance_create_depth(door_next_coord[0] * 32, door_next_coord[1] * 32, 0, obj_door)
	if (door_prev_coord[0] == door_next_coord[0]) {
		way_begin = min(door_prev_coord[1], door_next_coord[1])
		way_end = max(door_prev_coord[1], door_next_coord[1])
		for (j = way_begin + 1; j < way_end; j++) {
			instance_create_depth((door_prev_coord[0] - 1) * 32, j * 32, 0, obj_wall)
			instance_create_depth((door_prev_coord[0] + 1) * 32, j * 32, 0, obj_wall)
		}
	} else {
		way_begin = min(door_prev_coord[0], door_next_coord[0])
		way_end = max(door_prev_coord[0], door_next_coord[0])
		for (j = way_begin + 1; j < way_end; j++) {
			instance_create_depth(j * 32, (door_prev_coord[0] - 1) * 32, 0, obj_wall)
			instance_create_depth(j * 32, (door_prev_coord[0] + 1) * 32, 0, obj_wall)
		}
	}
}