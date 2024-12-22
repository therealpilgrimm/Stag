// Draw Iso Map
// Feather ignore all
var _start = room_width * 0.5;
var _x = MAP_WIDTH * 0.5;
var _left = _start - _x;
var _right = _start + _x;
var _top = room_height * 0.5 - MAP_HEIGHT * 0.5;
var _bottom = _top + MAP_HEIGHT;


for(var _row = 0; _row < CELLS; _row++) {
	for(var _column = 0; _column < CELLS; _column++) {
		var _cell = iso_map[_row][_column];
		var _cx = _start + -1 * (_row * CELL_WIDTH * 0.5) + (_column * CELL_WIDTH * 0.5)
		var _cy = _cell.actual_offset + _top + (_row  + _column) * CELL_HEIGHT * 0.5 + 10 * sin(current_time / _cell.offset * 0.002);
		_cell.x = _cx;
		_cell.y = _cy;
	}
}

