extends State

@export var speed = 100
@export var gravity_multiplier = 0.8
var gravity : int = ProjectSettings.get_setting(
		"physics/2d/default_gravity"
	) * gravity_multiplier

func _ready():
	state_name = "air"

func enter():
	print("Entering Air")
	
func exit(newState):
	print("Exiting Air")
	
func process(delta):		
	if Input.is_action_pressed("dash"):
		change_to_state.emit("dash")
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
	
func physics_process(delta):
	managed_entity.velocity.x = 0
	if Input.is_action_pressed("move_right"):
		managed_entity.velocity.x = speed
	if Input.is_action_pressed("move_left"):
		managed_entity.velocity.x = -1 * speed
	
	managed_entity.velocity.y = Vector2.DOWN.y * _get_velocity_applying_gravity(managed_entity.velocity.y, delta)
	
# MRUA -> v = v0 + a*t
func _get_velocity_applying_gravity(initial_velocity, time) -> float:
	return initial_velocity + gravity * time
