extends State

@export var speed = 100
@export var gravity_multiplier = 0.8
var custom_gravity : float = GravityUtils.get_gravity() * gravity_multiplier

func _ready():
	state_name = "air"

func enter():
	print("Entering Air")
	
func exit(newState):
	managed_entity.velocity.x = 0
	print("Exiting Air")
	
func process(delta):
	if Input.is_action_pressed("dash"):
		change_to_state.emit("dash")
		
	if Input.is_action_pressed("move_down") and Input.is_action_pressed("jump"):
		change_to_state.emit("air_stomp")
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
	
	if managed_entity.is_on_wall() and _is_entity_going_down():
		change_to_state.emit("wall_slide")
	
func physics_process(delta):
	var input_dir = Input.get_axis("move_left", "move_right")
	if input_dir != 0: # Need to do this as to not overwrite the movement of other states like wall_jump if there is no input while on air
		managed_entity.velocity.x =  input_dir * speed
		
	managed_entity.velocity.y = Vector2.DOWN.y * GravityUtils.get_velocity_applying_acceleration(\
		managed_entity.velocity.y, \
		custom_gravity,\
		delta\
	)
	
func _is_entity_going_down():
	return managed_entity.velocity.y > 0

