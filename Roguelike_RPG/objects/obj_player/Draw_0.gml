dir = point_direction(x, y, mouse_x, mouse_y)
horizontal_reflection = 1
switch (state) {
	case PlayerState.idle: {
		if (dir < 60) {
			sprite_body = sp_hero_back_right_idle
			sprite_left_hand = sp_hero_back_right_idle_l_arm_ww
			sprite_right_hand = sp_hero_back_right_idle_r_arm_ww
		} else if (dir < 120) {
			sprite_body = sp_hero_back_mid_idle
			sprite_left_hand = sp_hero_back_mid_idle_l_arm_ww
			sprite_right_hand = sp_hero_back_mid_idle_r_arm_ww
		} else if (dir < 180) {
			horizontal_reflection = -1
			sprite_body = sp_hero_back_right_idle
			sprite_left_hand = sp_hero_back_right_idle_l_arm_ww
			sprite_right_hand = sp_hero_back_right_idle_r_arm_ww
		} else if (dir < 210) {
			horizontal_reflection = -1
			sprite_body = sp_hero_front_right_idle
			sprite_left_hand = sp_hero_front_right_idle_l_arm_ww
			sprite_right_hand = sp_hero_front_right_idle_r_arm_ww
		} else if (dir < 270) {
			sprite_body = sp_hero_front_mid_idle
			sprite_left_hand = sp_hero_front_mid_idle_l_arm_ww
			sprite_right_hand = sp_hero_front_mid_idle_r_arm_ww
		} else {
			sprite_body = sp_hero_front_right_idle
			sprite_left_hand = sp_hero_front_right_idle_l_arm_ww
			sprite_right_hand = sp_hero_front_right_idle_r_arm_ww
		}
		break;
	}
	case PlayerState.run: {
		if (dir < 60) {
			sprite_body = sp_hero_back_right_run
			sprite_left_hand = sp_hero_back_right_run_l_arm_ww
			sprite_right_hand = sp_hero_back_right_run_r_arm_ww
		} else if (dir < 120) {
			sprite_body = sp_hero_back_mid_run
			sprite_left_hand = sp_hero_back_mid_run_l_arm_ww
			sprite_right_hand = sp_hero_back_mid_run_r_arm_ww
		} else if (dir < 180) {
			horizontal_reflection = -1
			sprite_body = sp_hero_back_right_run
			sprite_left_hand = sp_hero_back_right_run_l_arm_ww
			sprite_right_hand = sp_hero_back_right_run_r_arm_ww
		} else if (dir < 210) {
			horizontal_reflection = -1
			sprite_body = sp_hero_front_right_run
			sprite_left_hand = sp_hero_front_right_run_l_arm_ww
			sprite_right_hand = sp_hero_front_right_run_r_arm_ww
		} else if (dir < 270) {
			sprite_body = sp_hero_front_mid_run
			sprite_left_hand = sp_hero_front_mid_run_l_arm_ww
			sprite_right_hand = sp_hero_front_mid_run_r_arm_ww
		} else {
			sprite_body = sp_hero_front_right_run
			sprite_left_hand = sp_hero_front_right_run_l_arm_ww
			sprite_right_hand = sp_hero_front_right_run_r_arm_ww
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

if (dir < 180) {
	draw_sprite_ext(sprite_body, image_index, x, y, horizontal_reflection, 1, 0, c_white, 1)
	draw_sprite_ext(sprite_left_hand, image_index, x, y, horizontal_reflection, 1, dir, c_white, 1)
	draw_sprite_ext(sprite_right_hand, image_index, x, y, horizontal_reflection, 1, dir, c_white, 1)
} else {
	draw_sprite_ext(sprite_left_hand, image_index, x, y, horizontal_reflection, 1, dir, c_white, 1)
	draw_sprite_ext(sprite_right_hand, image_index, x, y, horizontal_reflection, 1, dir, c_white, 1)
	draw_sprite_ext(sprite_body, image_index, x, y, horizontal_reflection, 1, 0, c_white, 1)
}