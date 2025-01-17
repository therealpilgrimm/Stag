// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_extrema_values_array_2d(){
/// @description Get Minimum and Maximum values of a 2D Array
/// @param {array} input

var inputArray = argument[0];

var result;
var valueMin = inputArray[0,0];
var valueMax = inputArray[0,0];
for(var yy = 0; yy < array_height_2d(inputArray); yy += 1) {
	for(var xx = 0; xx < array_length_2d(inputArray, yy); xx += 1) {
		valueMin = min(valueMin, inputArray[yy, xx]);
		valueMax = max(valueMax, inputArray[yy, xx]);
	}
}

result[0] = valueMin;
result[1] = valueMax
return result;
}