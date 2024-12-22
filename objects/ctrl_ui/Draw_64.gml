draw_set_color(c_black);
draw_set_alpha(0.8);
draw_rectangle(0,0, window_get_width(), 64, false)
draw_set_color(c_white);
draw_set_alpha(1.0);
//draw_text(10, 10, $"Tanks Alive: {genius.tank_count}")
draw_set_halign(fa_center);
draw_text(window_get_width() div 2, 10, $"Next Event: {ctrl_events.event_timer div 60}")
draw_set_halign(fa_left);