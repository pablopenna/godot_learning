extends State

@export var wall_jump_speed = 300
@export var wall_jump_direction_addition: Vector2 = Vector2.UP

func _ready():
	state_name = "wall_jump"

func enter():
	print("Entering Wall Jump")
	
func exit(newState):
	print("Exiting Wall Jump")
	
func process(delta):
	var wall_normal = managed_entity.get_wall_normal()
	var jump_direction = wall_normal + wall_jump_direction_addition
	managed_entity.velocity = jump_direction * wall_jump_speed
	
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
	else:
		change_to_state.emit("air")
	
	
