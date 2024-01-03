extends State

@export var wall_jump_speed = 300
@export var wall_jump_direction_addition: Vector2 = Vector2.UP
@export var min_time_before_going_to_air_in_seconds: float = 0.2
var start_time: float

func _ready():
	state_name = "wall_jump"
	

func enter():
	print("Entering Wall Jump")
	start_time = Time.get_unix_time_from_system()
	
	_add_jump_velocity()
	
func exit(newState):
	print("Exiting Wall Jump")
	
func process(delta):
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
	elif _has_min_time_passed():
		change_to_state.emit("air")
		
func _add_jump_velocity():
	var wall_normal = managed_entity.get_wall_normal()
	var jump_direction = wall_normal + wall_jump_direction_addition
	managed_entity.velocity = jump_direction * wall_jump_speed	

func _has_min_time_passed():
	return Time.get_unix_time_from_system() - start_time > min_time_before_going_to_air_in_seconds
	
	
