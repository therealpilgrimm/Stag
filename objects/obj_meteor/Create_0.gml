random_row = irandom(CELLS - 1);
random_column = irandom(CELLS - 1);
radius = 5;
cell = genius.iso_map[random_row][random_column];
cells = isometric_collision_circle_array(random_row, random_column, radius);
/*
ellipse_width = 5 * cell.sprite_width;  // 5 tiles radius horizontally
ellipse_height = (5 * cell.sprite_height) / 2;  // Adjusted for the 2:1 isometric ratio

// Create the collision ellipse
collision_cells = collision_ellipse_list(
    cell.x - ellipse_width, 
    cell.y - ellipse_height, 
    cell.x + ellipse_width, 
    cell.y + ellipse_height, 
    obj_cell, 
    false, 
    false,
	cells,
	false
);
*/
for (var _c = 0; _c < array_length(cells); _c++) {
	cells[_c].image_blend = c_red;
}

x = cell.ox + 6060;
y = cell.oy -3260;
direction = point_direction(x, y, cell.ox, cell.oy);
speed = 10;
