for (var _c = 0; _c < array_length(cells); _c++) {
		if cells[_c].nft {
			genius.tank_count--;
			delete_nft(cells[_c]);
			
		}
		cells[_c].nft = false;
		cells[_c].sprite_index = cells[_c].sprite;
		cells[_c].image_blend = c_gray;
		//cells[_c].visible = false;
}