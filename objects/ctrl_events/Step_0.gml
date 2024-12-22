if not active return;

event_timer--;


if event_timer <= 0 {
	event_timer = event_seconds * game_get_speed(gamespeed_fps);
	var _event = events[irandom(array_length(events) - 1)];
	if _event == obj_acidrain active = false;
	instance_create_depth(0, 0, -100000, _event);
}

if genius.tank_count <= 300 {
	events = [obj_acidrain];
}
