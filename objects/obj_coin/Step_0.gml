if spawn {
	if point_distance(x, y, cell.ox, cell.oy) <= speed {
		speed = 0;
	
		for (var _c = 0; _c < array_length(cells); _c++) {
			if cells[_c].nft genius.tank_count--;
			cells[_c].nft = false;
			cells[_c].sprite_index = cells[_c].sprite;
			cells[_c].image_blend = c_gray;
			//cells[| _c].visible = false;
		
		
			ctrl_camera.start_shake(game_get_speed(gamespeed_fps) * 0.15, 60);
			
			spawn = false;
			change_target = true;
		}
	}
}

if change_target {
	if bounce_count >= bounces {
		change_target = false;
		bounces_complete = true;
	} else {
		bounce_direction ??= bounce_directions[irandom(array_length(bounce_directions) - 1)];
		bounce_previous_direction = bounce_direction;
		var _prev_row = random_row;
		var _prev_col = random_column;
		bounce_distance ??= (CELLS * 1/3) div 1;
		if bounce_direction == "row_up" && _prev_row <= bounce_distance {
			var _coinflip = irandom(1);
			bounce_direction = _coinflip ? "column_left" : "column_right";
		}
		if bounce_direction == "row_down" && _prev_row >= CELLS - bounce_distance {
			var _coinflip = irandom(1);
			bounce_direction = _coinflip ? "column_left" : "column_right";
		}
		if bounce_direction == "column_left" && _prev_col <= bounce_distance {
			var _coinflip = irandom(1);
			bounce_direction = _coinflip ? "row_up" : "row_down";
		}
		if bounce_direction == "column_right" && _prev_col >= CELLS - bounce_distance {
			var _coinflip = irandom(1);
			bounce_direction = _coinflip ? "row_up" : "row_down";
		}
		switch(bounce_direction) {
			case "row_up":
				random_row = irandom_range(max(0, _prev_row - 10), max(0, _prev_row - bounce_distance));
			break;
			case "row_down":
				random_row = irandom_range(min(_prev_row + 10, CELLS - 1), min(_prev_row + bounce_distance, CELLS - 1));
			break;
			case "column_left":
				random_column = irandom_range(max(0, _prev_col - 10), max(0, _prev_col - bounce_distance));
			break;
			case "column_right":
				random_column = irandom_range(min(_prev_col + 10, CELLS - 1), min(_prev_col + bounce_distance, CELLS - 1));
			break;
		}
		ox = cell.ox;
		oy = cell.oy;
		cell = genius.iso_map[random_row][random_column];
		tx = cell.ox;
		ty = cell.oy;
		bounce_timer.seconds = bounce_seconds / (1 + 0.1 * bounce_count);
		cells = isometric_collision_circle_array(random_row, random_column, radius);

		for (var _c = 0; _c < array_length(cells); _c++) {
			cells[_c].image_blend = c_red;
		}
	
		change_target = false;
		bounce = true;
		//bounce_distance = round(bounce_distance * 0.9);
	}
	
}

if bounce {
	bounce_timer.run();
	if bounce_timer.progress >= 1 {

		bounce_timer.reset();
		bounce = false;
		destroy_targets = true;
		bounce_count++;
	} else {
		x = ox + (tx - ox) * bounce_curve_h.get(bounce_timer.progress);
		y = oy + (ty - oy) * bounce_curve_h.get(bounce_timer.progress) - bounce_offset * bounce_curve_v.get(bounce_timer.progress);
	}
	
}

if destroy_targets {
	for (var _c = 0; _c < array_length(cells); _c++) {
		if cells[_c].nft {
			genius.tank_count--;
			delete_nft(cells[_c]);
		}
		cells[_c].nft = false;
		cells[_c].sprite_index = cells[_c].sprite;
		cells[_c].image_blend = c_gray;
		//cells[| _c].visible = false;
		
		
		ctrl_camera.start_shake(game_get_speed(gamespeed_fps) * 0.15, 60);
			
		destroy_targets = false;
		change_target = true;
	}
}

if bounces_complete {
	instance_destroy(id)
}