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
	camera_set_view_size(view_camera[0], 32 * N_height * display_width / display_height, 32 * N_height)
} else {
	camera_set_view_size(view_camera[0], 32 * N_hor, 32 * N_hor * display_height / display_width)
}