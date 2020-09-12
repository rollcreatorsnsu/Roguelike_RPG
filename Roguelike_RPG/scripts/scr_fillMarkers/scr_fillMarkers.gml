function scr_fillMarkers(point){
	if (instance_position(point[0] * 32, point[1] * 32, obj_door) == noone) {
		tmp = [[point[0] - 1, point[1] - 1],
			[point[0], point[1] - 1],
			[point[0] + 1, point[1] - 1],
			[point[0] - 1, point[1]],
			[point[0] + 1, point[1]],
			[point[0] - 1, point[1] + 1],
			[point[0], point[1] + 1],
			[point[0] + 1, point[1] + 1]]
		for (ii = 0; ii < 8; ii++) {
			if (instance_position(tmp[ii][0] * 32, tmp[ii][1] * 32, obj_marker_wall) == noone &&
				instance_position(tmp[ii][0] * 32, tmp[ii][1] * 32, obj_marker_path) == noone) {
				instance_create_depth(tmp[ii][0] * 32, tmp[ii][1] * 32, 0, obj_marker_wall);
			}
		}
	}
	instance_deactivate_object(instance_position(point[0] * 32, point[1] * 32, obj_marker_wall))
	instance_create_depth(point[0] * 32, point[1] * 32, 0, obj_marker_path)
}