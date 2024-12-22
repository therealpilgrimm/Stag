function isometric_collision_circle_array(_row, _column, _radius){
	var _array = [];
	var _cell = genius.iso_map[_row][_column];
	
	// Get The Block
	for(var _r = _row - _radius; _r <= _row + _radius; _r++) {
		if _r < 0 || _r >= CELLS continue;
		for(var _c = _column - _radius; _c <= _column + _radius; _c++) {
			if _c < 0 || _c >= CELLS continue;
			var _grid_distance = sqrt(sqr(_r - _row) + sqr(_c - _column));
			if _grid_distance <= _radius array_push(_array, genius.iso_map[_r][_c]);
		}
	}

	
	return _array;
}