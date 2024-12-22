whisp_amount = irandom_range(5, 10);
targets = [];
repeat whisp_amount {
	
	var _target = genius.nft_cells[irandom(array_length(genius.nft_cells))];
	instance_create_depth(0,0,depth,obj_whisp, {target: _target});
	array_push(targets, _target);
	
}