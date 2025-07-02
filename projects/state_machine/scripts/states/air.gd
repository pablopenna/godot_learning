extends State

@export var dash_state: State
const horizontal_speed = 300
const gravity_multiplier = 1
const gravity_increase_on_jump_input_release = 15
const minimum_time_before_gravity_increase_enabled_ms = 150
var entered_state_time_ms: int
var custom_gravity : float = GravityUtils.get_gravity() * gravity_multiplier
var is_there_momentum: bool
var has_gravity_increase_been_applied: bool

func _ready():
	state_name = "air"

func enter(old_state):
	print("Entering Air")
	is_there_momentum = true
	has_gravity_increase_been_applied = false
	entered_state_time_ms = Time.get_ticks_msec()
	
func exit(newState):
	managed_entity.velocity.x = 0
	print("Exiting Air")
	
func process(delta):
	if Input.is_action_pressed("dash") and dash_state._is_dash_ready():
		change_to_state.emit("dash")
		return
		
	if Input.is_action_pressed("move_down") and Input.is_action_just_pressed("jump"):
		change_to_state.emit("air_stomp")
		return
		
	if Input.is_action_just_pressed("attack"):
		change_to_state.emit("rush_attack")
		return
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
		return
	
	if managed_entity.is_on_wall() and _is_entity_going_down():
		change_to_state.emit("wall_slide")
		return
	
	var input_dir = Input.get_axis("move_left", "move_right")
	if input_dir != 0 or not is_there_momentum: # Need to do this as to not overwrite the movement of other states like wall_jump if there is no input while on air
		is_there_momentum = false
		managed_entity.velocity.x =  input_dir * horizontal_speed
		
	var frame_gravity = custom_gravity
	if _should_apply_gravity_increase():
		frame_gravity = custom_gravity * gravity_increase_on_jump_input_release
		has_gravity_increase_been_applied = true
		if managed_entity.velocity.y < 0:
			managed_entity.velocity.y = 0
	
	managed_entity.velocity.y = Vector2.DOWN.y * GravityUtils.get_velocity_applying_acceleration(
		managed_entity.velocity.y,
		frame_gravity,
		delta
	)
	
func _should_apply_gravity_increase():
	var current_time_ms = Time.get_ticks_msec()
	if current_time_ms < entered_state_time_ms + minimum_time_before_gravity_increase_enabled_ms:
		return false
	if Input.is_action_pressed("jump"):
		return false
	if has_gravity_increase_been_applied:
		return false
	return true
	
func _is_entity_going_down():
	return managed_entity.velocity.y > 0
