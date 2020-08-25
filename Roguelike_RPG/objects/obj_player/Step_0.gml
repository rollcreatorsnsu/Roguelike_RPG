dir = point_direction(x, y, mouse_x, mouse_y)
if (dir < 60) {
	player_dir = PlayerDir.RightTop
} else if (dir < 120) {
	player_dir = PlayerDir.MiddleTop
} else if (dir < 180) {
	player_dir = PlayerDir.LeftTop
} else if (dir < 210) {
	player_dir = PlayerDir.LeftBottom
} else if (dir < 270) {
	player_dir = PlayerDir.MiddleBottom
} else {
	player_dir = PlayerDir.RightBottom
}