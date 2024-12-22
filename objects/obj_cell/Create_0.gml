self[$ "sprite"] ??= spr_water;
sprite_index = sprite;
nft = false;

ox = x;
oy = y;
change_to_nft = function(_data) {
	sprite_index = _data.sprite;
}

change_to_terrain = function() {
	sprite_index = sprite;
}
image_index = random(sprite_get_number(image_number));