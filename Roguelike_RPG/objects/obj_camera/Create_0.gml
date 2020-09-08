N_height = 12
N_hor = 16
display_height = display_get_height()
display_width = display_get_width()
window_set_fullscreen(true)
view_enabled = true
view_visible[0] = true
block_height = display_height / N_height
block_width = display_width / N_hor
if (block_height < block_width) {
	camera_height = 32 * N_height
	camera_width = round(camera_height * display_width / display_height)
} else {
	camera_width = 32 * N_hor
	camera_height = round(camera_width * display_height / display_width)
}
camera_width = display_width / round(display_width / camera_width)
camera_height = display_height / round(display_height / camera_height)
surface_resize(application_surface, camera_width, camera_height)
camera_set_view_size(view_camera[0], camera_width, camera_height)