timer.run();

if timer.progress >= 1 {
	if radius != max_radius {
		timer.reset();
		radius++;
		cells = isometric_collision_circle_array(random_row, random_column, radius);
		for (var _c = 0; _c < array_length(cells); _c++) {
			cells[_c].image_blend = c_red;
		}
	} else {
		instance_destroy(id);
	}
	
	
}