for (var _c = 0; _c < array_length(cells); _c++) {
		if cells[_c].nft {
			genius.tank_count--;
			delete_nft(cells[_c]);
		}
		cells[_c].nft = false;
		cells[_c].sprite_index = cells[_c].sprite;
		cells[_c].image_blend = c_gray;	
		ctrl_camera.start_shake(game_get_speed(gamespeed_fps) * 0.15, 10)
}


for(var _t = 0; _t < array_length(obj_whisps.targets); _t++) {
	if obj_whisps.targets[_t] == target array_delete(obj_whisps.targets, _t, 1);
}