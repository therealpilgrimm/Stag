function delete_nft(_nft){
	for(var _n = 0; _n < array_length(genius.nft_cells); _n++) {
		if genius.nft_cells[_n].nft == _nft array_delete(genius.nft_cells, _n, 1);
	}
}