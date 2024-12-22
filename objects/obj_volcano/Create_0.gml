random_row = irandom_range(10, CELLS - 11);
random_column = irandom_range(10, CELLS - 11);
radius = 2;
max_radius = irandom_range(5, 10);

_spawn = genius.iso_map[random_row][random_column];
cells = isometric_collision_circle_array(random_row, random_column, radius);
for (var _c = 0; _c < array_length(cells); _c++) {
	cells[_c].image_blend = c_red;
}

timer = new Timer(1);

x = _spawn.ox;
y = _spawn.oy;