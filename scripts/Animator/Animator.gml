function Animator(_animation_curve, _channel) constructor {
	animation_curve = animcurve_get(_animation_curve);
	animation_channel = animcurve_get_channel(animation_curve, _channel);
	
	static get = function(_value) {
		return animcurve_channel_evaluate(animation_channel, _value);
	}
	
}