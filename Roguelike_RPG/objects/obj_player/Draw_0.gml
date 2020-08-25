horizontal_reflection = 1
switch (state) {
	case PlayerState.idle: {
		switch (player_dir) {
			case PlayerDir.MiddleBottom: {
				sprite_body = sp_hero_front_mid_idle
				sprite_left_hand = sp_hero_front_mid_idle_l_arm_ww
				sprite_right_hand = sp_hero_front_mid_idle_r_arm_ww
				break;
			}
			case PlayerDir.MiddleTop: {
				sprite_body = sp_hero_back_mid_idle
				sprite_left_hand = sp_hero_back_mid_idle_l_arm_ww
				sprite_right_hand = sp_hero_back_mid_idle_r_arm_ww
				break;
			}
			case PlayerDir.LeftBottom: {
				horizontal_reflection = -1
			}
			case PlayerDir.RightBottom: {
				sprite_body = sp_hero_front_right_idle
				sprite_left_hand = sp_hero_front_right_idle_l_arm_ww
				sprite_right_hand = sp_hero_front_right_idle_r_arm_ww
				break;
			}
			case PlayerDir.LeftTop: {
				horizontal_reflection = -1
			}
			case PlayerDir.RightTop: {
				sprite_body = sp_hero_back_right_idle
				sprite_left_hand = sp_hero_back_right_idle_l_arm_ww
				sprite_right_hand = sp_hero_back_right_idle_r_arm_ww
				break;
			}
		}
		break;
	}
	case PlayerState.run: {
		switch (player_dir) {
			case PlayerDir.MiddleBottom: {
				sprite_body = sp_hero_front_mid_run
				sprite_left_hand = sp_hero_front_mid_run_l_arm_ww
				sprite_right_hand = sp_hero_front_mid_run_r_arm_ww
				break;
			}
			case PlayerDir.MiddleTop: {
				sprite_body = sp_hero_back_mid_run
				sprite_left_hand = sp_hero_back_mid_run_l_arm_ww
				sprite_right_hand = sp_hero_back_mid_run_r_arm_ww
				break;
			}
			case PlayerDir.LeftBottom: {
				horizontal_reflection = -1
			}
			case PlayerDir.RightBottom: {
				sprite_body = sp_hero_front_right_run
				sprite_left_hand = sp_hero_front_right_run_l_arm_ww
				sprite_right_hand = sp_hero_front_right_run_r_arm_ww
				break;
			}
			case PlayerDir.LeftTop: {
				horizontal_reflection = -1
			}
			case PlayerDir.RightTop: {
				sprite_body = sp_hero_back_right_run
				sprite_left_hand = sp_hero_back_right_run_l_arm_ww
				sprite_right_hand = sp_hero_back_right_run_r_arm_ww
				break;
			}
		}
		break;
	}
}

switch (current_weapon) {
	case obj_pistol: {
		sprite_right_hand = sp_hero_back_mid_idle_r_arm_w
		break;
	}
	case obj_machine_gun: {
		break;
	}
}

dir = point_direction(x, y, mouse_x, mouse_y)

switch (player_dir) {
	case PlayerDir.LeftBottom:
	case PlayerDir.MiddleBottom:
	case PlayerDir.RightBottom: {
		draw_sprite_ext(sprite_body, image_index, x, y, horizontal_reflection, 1, 0, c_white, 1)
		draw_sprite_ext(sprite_left_hand, image_index, x, y, horizontal_reflection, 1, dir, c_white, 1)
		draw_sprite_ext(sprite_right_hand, image_index, x, y, horizontal_reflection, 1, dir, c_white, 1)
		break;
	}
	case PlayerDir.LeftTop:
	case PlayerDir.MiddleTop:
	case PlayerDir.RightTop: {
		draw_sprite_ext(sprite_left_hand, image_index, x, y, horizontal_reflection, 1, dir, c_white, 1)
		draw_sprite_ext(sprite_right_hand, image_index, x, y, horizontal_reflection, 1, dir, c_white, 1)
		draw_sprite_ext(sprite_body, image_index, x, y, horizontal_reflection, 1, 0, c_white, 1)
		break;
	}
}