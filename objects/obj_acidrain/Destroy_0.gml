
array_foreach(genius.nft_cells, function(_c){
	if _c == winner return;
	_c.nft.nft = false;
	_c.nft.sprite_index = _c.nft.sprite;
	_c.nft.image_blend = c_gray;
});

genius.nft_cells = [winner];
ctrl_camera.target = winner.nft;