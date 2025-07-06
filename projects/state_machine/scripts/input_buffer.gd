class_name InputBuffer extends Node

var _last_tick_jump_input_pressed: int = -9999
var _last_tick_on_ground: int = -9999

const threshold_buffered_jump_is_allowed_ms: int = 250
const threshold_coyote_time_is_allowed_ms: int = 500

func _input(event):
	if event.is_action_pressed("jump"):
		print("refresh buffer jump")
		_last_tick_jump_input_pressed = Time.get_ticks_msec()

func should_buffer_jump():
	var current_ticks = Time.get_ticks_msec()
	return \
		current_ticks >= _last_tick_jump_input_pressed \
		and current_ticks < _last_tick_jump_input_pressed + threshold_buffered_jump_is_allowed_ms

func update_last_ground_time():
	_last_tick_on_ground = Time.get_ticks_msec()

func can_coyote_time():
	var current_ticks = Time.get_ticks_msec()
	return \
		current_ticks >= _last_tick_on_ground \
		and current_ticks < _last_tick_on_ground + threshold_coyote_time_is_allowed_ms
