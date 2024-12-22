// Apply screen shake if active
if (shake_timer > 0) {
    shake_timer -= 1; // Decrease the shake timer
    shake_offset_x = random_range(-shake_intensity, shake_intensity);
    shake_offset_y = random_range(-shake_intensity, shake_intensity);
} else {
    shake_offset_x = 0;
    shake_offset_y = 0;
}

camera_set_view_size(VIEW, w * z, h * z);
current_x = 0 - (camera_get_view_width(VIEW) - w) * 0.5 + offset_x + shake_offset_x;
current_y = 0 - (camera_get_view_height(VIEW) - h) * 0.5 + offset_y + shake_offset_y;
camera_set_view_pos(VIEW, current_x, current_y)


