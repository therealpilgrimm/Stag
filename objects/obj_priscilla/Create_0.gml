dir = irandom(1); //row or column
range = 20;
start = irandom_range(0, 48);
cells = [];

timer = new Timer(3);
ctrl_camera.start_shake(game_get_speed(gamespeed_fps) * 3.3, 60)

for(var _row = start; _row <= start + range; _row++) {
	for(var _column = 68; _column >= 0; _column--) {
		var _cell = genius.iso_map[dir ? _row : _column][dir ? _column : _row];
		_cell.image_blend = c_red;
		array_push(cells, _cell);
	}
}
