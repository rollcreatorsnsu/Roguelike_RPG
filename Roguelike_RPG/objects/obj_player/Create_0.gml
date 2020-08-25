enum PlayerState {
	idle,
	run
}
enum PlayerDir {
	RightTop,
	MiddleTop,
	LeftTop,
	LeftBottom,
	MiddleBottom,
	RightBottom
}
state = PlayerState.idle
player_dir = PlayerDir.MiddleBottom
current_weapon = undefined