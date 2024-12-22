for (var _c = 0; _c < ds_list_size(list); _c++) {
		if list[| _c].nft {
			genius.tank_count--;
			delete_nft(list[| _c]);
			
		}
		list[| _c].nft = false;
		list[| _c].sprite_index = list[| _c].sprite;
		list[| _c].image_blend = c_gray;
		//cells[_c].visible = false;
}