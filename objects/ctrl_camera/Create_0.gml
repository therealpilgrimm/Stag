#macro VIEW view_camera[0]

w = window_get_width();
h = window_get_height();
z = 1.0;

prev_x = undefined;
prev_y = undefined;
drag_start = false;
offset_x = 0;
offset_y = 0;
current_x = 0;
current_y = 0;
busy = false;
target_x = 0
target_y = 0
new_offset_x = 0
new_offset_y = 0
target = undefined;

// Shake variables
shake_duration = 0;    // How long the shake lasts
shake_intensity = 0;   // The intensity of the shake
shake_timer = 0;       // Internal timer to track the shake progress
shake_offset_x = 0;    // Temporary x offset caused by shake
shake_offset_y = 0;    // Temporary y offset caused by shake

start_shake = function(_duration, _intensity) {
	shake_duration = _duration;
	shake_intensity = _intensity;
	shake_timer = shake_duration;
}