function Timer(_seconds) constructor {
	seconds  = _seconds;
	current  = 0.0;
	progress = 0.0;
	active   = true;
	
	static start = function() {
		active = true;
	}
	static stop  = function() {
		active = false;
	}
	static run   = function() {
		if not active return;
		current += delta_time / 1_000_000;
		progress = current / seconds;
	}
	static reset = function() {
		current = 0.0;
		progress = 0.0;
	}
}