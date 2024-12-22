event_seconds = 3;
event_timer = event_seconds * game_get_speed(gamespeed_fps); // seconds
active = true;

events = [
		obj_meteor,
		obj_nuke,
		obj_priscilla,
		obj_whisps,
		obj_coin,
		obj_dragonstrafe,
		obj_rugpull,
		obj_volcano
]

//instance_create_depth(0, 0, -100000, obj_dragonstrafe);