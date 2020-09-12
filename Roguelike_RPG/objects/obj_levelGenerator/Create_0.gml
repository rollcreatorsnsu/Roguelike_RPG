random_set_seed(randomise())
files = []
files_number = scr_getFilesByMask(files, "usual*.room")
rooms_count = get_integer("Enter number of rooms", 4)
full_width = 0
full_height = 0
room_coords = []
doors_coords = []
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
	if (full_width > full_height) {
		x0 = 0
		y0 = full_height + 1
	} else {
		x0 = full_width + 1
		y0 = 0
	}
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
	scr_putObject(file, x0, y0, doors_coords, i)
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
x0 = -width - 3 - 1
y0 = -1
room_coords[rooms_count] = [x0, y0, x0 + width + 3, y0 + width + 3]
scr_putObject(file, x0, y0, doors_coords, rooms_count)
file_text_close(file)
rooms_count++

files = []
files_number = scr_getFilesByMask(files, "boss*.room")
room_number = irandom_range(0, files_number - 1)
file = file_text_open_read(files[room_number])
width = file_text_read_real(file)
file_text_readln(file)
height = file_text_read_real(file)
file_text_readln(file)
x0 = full_width + 1
y0 = full_height - height
room_coords[rooms_count] = [x0, y0, x0 + width + 3, y0 + width + 3]
scr_putObject(file, x0, y0, doors_coords, rooms_count)
file_text_close(file)
rooms_count++

files = []
files_number = scr_getFilesByMask(files, "treasure*.room")
room_number = irandom_range(0, files_number - 1)
file = file_text_open_read(files[room_number])
width = file_text_read_real(file)
file_text_readln(file)
height = file_text_read_real(file)
file_text_readln(file)
if (full_width > full_height) {
	x0 = full_width + 1
	y0 = -1
} else {
	x0 = -width - 3 - 1
	y0 = full_height - height
}
room_coords[rooms_count] = [x0, y0, x0 + width + 3, y0 + width + 3]
scr_putObject(file, x0, y0, doors_coords, rooms_count)
file_text_close(file)
rooms_count++

files = []
files_number = scr_getFilesByMask(files, "shop*.room")
room_number = irandom_range(0, files_number - 1)
file = file_text_open_read(files[room_number])
width = file_text_read_real(file)
file_text_readln(file)
height = file_text_read_real(file)
file_text_readln(file)
if (full_width > full_height) {
	x0 = -width - 3 - 1
	y0 = full_height - height
} else {
	x0 = full_width + 1
	y0 = -1
}
room_coords[rooms_count] = [x0, y0, x0 + width + 3, y0 + width + 3]
scr_putObject(file, x0, y0, doors_coords, rooms_count)
file_text_close(file)
rooms_count++

room_connections = []
connections_count = 0

connected_rooms = [0]

while (connections_count < rooms_count - 1) {
	minimum_distance = infinity
	minimum_distance_struct = []
	for (i = 0; i <= connections_count; i++) {
		for (j = 0; j < rooms_count; j++) {
			connected = false;
			for (k = 0; k <= connections_count; k++) {
				if (connected_rooms[k] == j) {
					connected = true;
					break;
				}
			}
			if (connected) continue
			for (k = 0; k < array_length(doors_coords[connected_rooms[i]]); k++) {
				for (l = 0; l < array_length(doors_coords[j]); l++) {
					locked = false
					for (m = 0; m < connections_count; m++) {
						if ((room_connections[m][0][0] == j && room_connections[m][0][1] == l) ||
							(room_connections[m][1][0] == j && room_connections[m][1][1] == l)) {
								locked = true
								break
						}
					}
					if (locked) continue
					distance = point_distance(doors_coords[connected_rooms[i]][k][0],
						doors_coords[connected_rooms[i]][k][1],
						doors_coords[j][l][0],
						doors_coords[j][l][1])
					if (distance < minimum_distance) {
						minimum_distance = distance
						minimum_distance_struct = [[connected_rooms[i], k], [j, l]]
					}
				}
			}
		}
	}
	room_connections[connections_count] = minimum_distance_struct
	connections_count++
	connected_rooms[connections_count] = minimum_distance_struct[1][0]
}

for (i = 0; i < rooms_count; i++) {
	for (j = 0; j < array_length_1d(doors_coords[i]); j++) {
		needed = false
		for (k = 0; k < connections_count; k++) {
			original_coords = doors_coords[i][j]
			begin_coords = doors_coords[room_connections[k][0][0]][room_connections[k][0][1]]
			end_coords = doors_coords[room_connections[k][1][0]][room_connections[k][1][1]]
			if (point_distance(original_coords[0], original_coords[1],
					begin_coords[0], begin_coords[1]) < 2 ||
				point_distance(original_coords[0], original_coords[1],
					end_coords[0], end_coords[1]) < 2) {
				needed = true;
				break;
			}
		}
		if (needed) continue
		instance_destroy(instance_position(doors_coords[i][j][0] * 32, doors_coords[i][j][1] * 32, obj_door));
		instance_create_depth(doors_coords[i][j][0] * 32, doors_coords[i][j][1] * 32, 0, obj_wall);
	}
}

for (i = 0; i < connections_count; i++) {
	point1 = doors_coords[room_connections[i][0][0]][room_connections[i][0][1]]
	point2 = doors_coords[room_connections[i][1][0]][room_connections[i][1][1]]
	points_start = []
	points_end = []
	check_start = [[point1[0] - 1, point1[1]],
		[point1[0], point1[1] - 1],
		point1,
		[point1[0], point1[1] + 1],
		[point1[0] + 1, point1[1]]]
	check_end = [[point2[0] - 1, point2[1]],
		[point2[0], point2[1] - 1],
		point2,
		[point2[0], point2[1] + 1],
		[point2[0] + 1, point2[1]]]
	for (k = 0; k < 5; k++) {
		if (instance_position(check_start[k][0] * 32, check_start[k][1] * 32, obj_door) != noone) {
			points_start[array_length(points_start)] = check_start[k];
		}
		if (instance_position(check_end[k][0] * 32, check_end[k][1] * 32, obj_door) != noone) {
			points_end[array_length(points_end)] = check_end[k];
		}
	}
	for (k = 0; k < array_length(points_start); k++) {
		for (l = 0; l < array_length(points_end); l++) {
			point1 = points_start[k]
			point2 = points_end[l]
			queue = ds_queue_create()
			visited = ds_map_create()
			ds_queue_enqueue(queue, point1)
			ds_map_add(visited, string(point1), [point1, "parent"])
			while (!ds_queue_empty(queue)) {
				node = ds_queue_dequeue(queue)
				if (point2[0] == node[0] && point2[1] == node[1]) {
					node = visited[? string(node)]
					break
				}
				points = [[node[0] - 1, node[1]],
					[node[0], node[1] + 1],
					[node[0] + 1, node[1]],
					[node[0], node[1] - 1]]
				for (j = 0; j < 4; j++) {
					if (instance_position(points[j][0] * 32, points[j][1] * 32, obj_wall)) {
						continue
					}
					if (instance_position(points[j][0] * 32, points[j][1] * 32, obj_door)) {
						if (points[j][0] != point2[0] || points[j][1] != point2[1]) {
							continue
						}
					}
					if (!ds_map_exists(visited, string(points[j]))) {
						ds_queue_enqueue(queue, points[j])
						ds_map_add(visited, string(points[j]), [points[j], string(node)])
					}
				}
			}
			node = visited[? node[1]]
			while (node[1] != "parent") {
				scr_fillMarkers(node[0])
				node = visited[? node[1]]
			}
			ds_queue_destroy(queue)
			ds_map_destroy(visited)
		}
	}
}

instance_destroy(obj_marker_path)
instance_destroy(obj_marker_wall)