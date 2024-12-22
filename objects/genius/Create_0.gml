#macro CELLS       69
#macro CELL_WIDTH  165
#macro CELL_HEIGHT 83
#macro MAP_WIDTH   CELLS * CELL_WIDTH
#macro MAP_HEIGHT  CELLS * CELL_HEIGHT
global.tooltip_target = undefined;

draw_set_font(fnt_game);
randomize();
iso_map = [];
noise = generate_noise_map(CELLS, 8, 7);
free_cells = [];
nft_cells = [];
for(var _row = 0; _row < CELLS; _row++) {
	for(var _column = 0; _column < CELLS; _column++) {
		#region Sprites
		var _terrains = [
			spr_water,
			spr_sand,
			spr_dirt,
			spr_grass,
			spr_rock,
			spr_snow,
			spr_ether,
			spr_indust
		];
		#endregion
		var _t = round(noise[_row][_column]) ;
		var _cell_data = {
			sprite:  _terrains[_t],
			offset: irandom_range(1, 10),
			actual_offset: -1 * _t * 20,
			row: _row,
			column: _column,
		}
		var _cx = room_width * 0.5 + -1 * (_row * CELL_WIDTH * 0.5) + (_column * CELL_WIDTH * 0.5)
		var _cy = room_height * 0.5 - MAP_HEIGHT * 0.5 + (_row  + _column) * CELL_HEIGHT * 0.5;
		var _cell = instance_create_depth(_cx, _cy, -1 * (_row + _column), obj_cell, _cell_data)
		
		iso_map[_row][_column] = _cell;
		array_push(free_cells, {row: _row, column: _column});
	}
}

// CAMERA
camera  = instance_create_depth(0,0,0,ctrl_camera);

// Events
events  = instance_create_depth(0,0,0,ctrl_events);

// UI
ui      = instance_create_depth(0,0,0,ctrl_ui)

// Tooltip
tooltip = instance_create_depth(0,0,0,ctrl_tooltip);


// Methods
place_tank = function(_row, _column) {
	var _cell = iso_map[_row][_column];
	_cell.sprite_index = spr_example_nft;
	_cell.nft = true;
	array_push(nft_cells, {
		nft: _cell,
		row: _row,
		column: _column,
	});
}

tank_count = 0;

repeat 3000 {
	var _index = irandom(array_length(free_cells) - 1);
	place_tank(free_cells[_index].row, free_cells[_index].column);
	array_delete(free_cells, _index, 1);
	
	tank_count++;
}