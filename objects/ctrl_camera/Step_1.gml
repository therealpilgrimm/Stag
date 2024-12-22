// Handle Anti Aliasing
if z % 0.5 == 0 && z <= 1 gpu_set_texfilter(false) else gpu_set_tex_filter(true);
// Center on Target
if (!is_undefined(target)) {
    var _wz = w * 0.5;
    var _hz = h * 0.5;
    var _x_co = _wz / camera_get_view_width(VIEW);
    var _y_co = _hz / camera_get_view_height(VIEW);
	var _blackbar_offset = 64;
    var _center_offset = _blackbar_offset + target.actual_offset;
    var _speed = 0.15;
    
    // Smoothly interpolate towards target
    z = lerp(z, 0.5, _speed);
    offset_x = lerp(offset_x, target.ox - _wz, _speed);
    offset_y = lerp(offset_y, target.oy - _hz - (CELL_HEIGHT - _center_offset), _speed);
    
    // Check proximity using absolute differences
    var z_diff = abs(z - 0.5);
    var x_diff = abs(offset_x - (target.ox - _wz));
    var y_diff = abs(offset_y - (target.oy - _hz - (CELL_HEIGHT - _center_offset)));

    // Thresholds for stopping
    var threshold_z = 0.01;
    var threshold_offset = 0.5;
    
    if (z_diff <= threshold_z && x_diff <= threshold_offset && y_diff <= threshold_offset) {
        z = 0.5;
        offset_x = target.ox - _wz;
        offset_y = target.oy - _hz - (CELL_HEIGHT - _center_offset);
        target = undefined;
    }
}


// Dragging
if is_undefined(target) {
	var _rightclick = mouse_check_button(mb_right);

	if (_rightclick) {
	    // Check if dragging has started
	    if (!drag_start) {
	        prev_x = device_mouse_x_to_gui(0); // Store the initial mouse position
	        prev_y = device_mouse_y_to_gui(0);
	        drag_start = true; // Set the drag flag
	    }

	    // Get the current mouse position
	    var cur_x = device_mouse_x_to_gui(0);
	    var cur_y = device_mouse_y_to_gui(0);

	    // Calculate the offset based on the mouse movement
	    offset_x -= (cur_x - prev_x) * z;
	    offset_y -= (cur_y - prev_y) * z;
	
		if offset_x < -6060 offset_x = -6060;
		if offset_x >  6060 offset_x =  6060;
		if offset_y < -3260 offset_y = -3260;
		if offset_y >  3090 offset_y =  3090;

	    // Update the previous mouse position for the next frame
	    prev_x = cur_x;
	    prev_y = cur_y;
	} else {
	    // Reset dragging state if the right mouse button is released
	    drag_start = false;
	    prev_x = undefined;
	    prev_y = undefined;
	}
}
