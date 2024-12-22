winner = genius.nft_cells[irandom(array_length(genius.nft_cells) - 1)];


for(var _c = 0; _c < array_length(genius.nft_cells); _c++) {
	if genius.nft_cells[_c] == winner continue;
	genius.nft_cells[_c].nft.image_blend = c_red;
}

acid_timer = new Timer(3);