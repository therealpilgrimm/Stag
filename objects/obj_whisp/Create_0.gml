
position = ["row_up", "row_down", "column_left", "column_right"];
choice = position[irandom(3)];

switch choice {
	case "row_up":
		x = target.nft.ox;
		y = target.nft.oy - 6000;
	break;
	case "row_down":
		x = target.nft.ox;
		y = target.nft.oy + 6000;
	break;
	case "column_left":
		x = target.nft.ox - 6000;
		y = target.nft.oy;
	break;
	case "column_right":
		x = target.nft.ox + 6000;
		y = target.nft.oy;
	break;
}

direction = point_direction(x, y, target.nft.ox, target.nft.oy);
speed = 50;
radius = 2;
cells = isometric_collision_circle_array(target.row, target.column, radius);
for (var _c = 0; _c < array_length(cells); _c++) {
	cells[_c].image_blend = c_orange;
}
target.nft.image_blend = c_red;
