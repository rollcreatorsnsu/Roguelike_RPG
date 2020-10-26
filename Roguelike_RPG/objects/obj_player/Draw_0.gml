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

dir_left = dir
dir_right = dir
vertical_reflection = (dir < 90 || dir > 270) ? 1 : -1

switch (current_weapon) {
	case obj_pistol: {
		sprite_right_hand = sp_hero_back_mid_idle_r_arm_w
		dir_left = (dir < 90 || dir > 270) ? 0 : 180
		break;
	}
	case obj_machine_gun: {
		break;
	}
}

left_hand_index = (left_hand_index + 1 / sprite_get_speed(sprite_left_hand)) % sprite_get_number(sprite_left_hand);
right_hand_index = (right_hand_index + 1 / sprite_get_speed(sprite_right_hand)) % sprite_get_number(sprite_right_hand);
body_index = (body_index + 1 / sprite_get_speed(sprite_body)) % sprite_get_number(sprite_body);

if (dir < 180) {
	draw_sprite_ext(sprite_left_hand, left_hand_index, x, y, 1, vertical_reflection, dir_left, c_white, 1)
	draw_sprite_ext(sprite_right_hand, right_hand_index, x, y, 1, vertical_reflection, dir_right, c_white, 1)
	draw_sprite_ext(sprite_body, body_index, x, y, horizontal_reflection, 1, 0, c_white, 1)	
} else {
	draw_sprite_ext(sprite_body, body_index, x, y, horizontal_reflection, 1, 0, c_white, 1)
	draw_sprite_ext(sprite_left_hand, left_hand_index, x, y, 1, vertical_reflection, dir_left, c_white, 1)
	draw_sprite_ext(sprite_right_hand, right_hand_index, x, y, 1, vertical_reflection, dir_right, c_white, 1)
}