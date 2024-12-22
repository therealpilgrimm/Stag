// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generate_simplex_extrapolate(){
	var xsb  = argument[0];
	var ysb  = argument[1];
	var dx   = argument[2];
	var dy   = argument[3];
	var perm = argument[4];

	var gradients2D = [
		5, 2, 2, 5,
		-5, 2, -2, 5,
		5, -2, 2, -5,
		-5, -2, -2, -5,
	];

	var index = perm[(perm[xsb & 0xFF] + ysb) & 0xFF] & 0x0E;
	return gradients2D[index] * dx + gradients2D[index + 1] * dy;
}