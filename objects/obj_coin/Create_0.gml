spawn = true;
change_target = false;
bounce = false;
destroy_targets = false;
random_row = irandom(CELLS - 1);
random_column = irandom(CELLS - 1);
radius = 2;

cell = genius.iso_map[random_row][random_column];
cells = isometric_collision_circle_array(random_row, random_column, radius);

for (var _c = 0; _c < array_length(cells); _c++) {
	cells[_c].image_blend = c_red;
}

x = cell.ox;
y = cell.oy - 6000;
ox = cell.ox;
oy = cell.oy;
tx = cell.ox;
ty = cell.oy;
bounce_offset = 1000;
bounce_count = 0;
bounces = irandom_range(5, 7);
bounce_directions = ["row_up", "row_down", "column_right", "column_left"];
bounce_direction = undefined;
bounce_previous_direction = undefined;
bounce_distance = undefined;
bounces_complete = false;
bounce_seconds = 1;
speed = 50;
direction = point_direction(x, y, cell.x, cell.y);


bounce_timer = new Timer(bounce_seconds);
bounce_curve_h = new Animator(ac_coin, "horizontal");
bounce_curve_v = new Animator(ac_coin, "vertical");

