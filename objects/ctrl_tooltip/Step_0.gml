target = undefined;
if position_meeting(mouse_x, mouse_y, obj_cell) {
	var _cell = instance_nearest(mouse_x, mouse_y, obj_cell);
	
	target = _cell.nft ? _cell : undefined;
}