ellipse_center_x = room_width / 2;
ellipse_center_y = 0;
ellipse_width = MAP_WIDTH; 
ellipse_height = MAP_HEIGHT;


generate_line = function(_cx, _cy, _radius) {
    var _angle = random(360); // Random angle in degrees
	var _reverse_angel = _angle + 180 + irandom_range(-45, 45);
    var _rad = degtorad(_angle); // Convert to radians
	var _rad2 = degtorad(_reverse_angel); // Convert to radians

    var _x = _cx + cos(_rad) * _radius; // X coordinate
    var _y = _cy + sin(_rad) * _radius; // Y coordinate
	var _xx = _cx + cos(_rad2) * _radius;
	var _yy = _cy + sin(_rad2) * _radius;

    return {x: _x, y: _y, x2: _xx, y2: _yy};
}

line = generate_line(room_width div 2, room_height div 2, MAP_WIDTH div 2);
list = ds_list_create();
cells_affected = collision_line_list(line.x, line.y, line.x2, line.y2, obj_cell, false, true, list, true);
for (var _c = 0; _c < ds_list_size(list); _c++) {
	var _cell = list[| _c];
	_cell.image_blend = c_red;
}

timer = new Timer(3);
ctrl_camera.start_shake(game_get_speed(gamespeed_fps) * 3.3, 30);


