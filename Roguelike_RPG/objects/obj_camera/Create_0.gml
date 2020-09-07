N_height = 12
N_hor = 16
view_enabled = true
view_visible[0] = true
camera_set_view_target(view_camera[0], obj_player)
window_height = window_get_height()
window_width = window_get_width()
block_height = window_height / N_height
block_width = window_width / N_hor
if (block_height < block_width) {
	camera_set_view_size(view_camera[0], 32 * N_height * window_width / window_height, 32 * N_height)
} else {
	camera_set_view_size(view_camera[0], 32 * N_hor, 32 * N_hor * window_height / window_width)
}