if position_meeting(mouse_x, mouse_y, obj_cell) {
	if mouse_check_button_pressed(mb_left) {
		var _cell = instance_nearest(mouse_x, mouse_y, obj_cell);
		target = _cell.nft ? _cell : undefined;
	}
}