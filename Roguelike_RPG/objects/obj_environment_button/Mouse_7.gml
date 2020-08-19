if (global.selected_cell != undefined && factory != undefined) {
	environ = instance_position(global.selected_cell.x, global.selected_cell.y, obj_environment)
	if (environ != undefined) {
		instance_destroy(environ)
	}
	instance_create_depth(global.selected_cell.x, global.selected_cell.y, 0, factory)
}