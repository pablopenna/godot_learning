extends State

const slide_speed = 10

func _ready():
	state_name = "wall_slide"

func enter(_old_state):
	print("Entering Wall Slide")
	
func exit(newState):
	print("Exiting Wall Slide")
	
func process(delta):
	var wall_normal = managed_entity.get_wall_normal() # get_wall_normal() is already normalized
	
	if Input.is_action_pressed("move_left") and _does_input_dir_match_wall_normal("move_left", wall_normal):
		change_to_state.emit("wall_unstick")
		
	if Input.is_action_pressed("move_right") and _does_input_dir_match_wall_normal("move_right", wall_normal):
		change_to_state.emit("wall_unstick")
	
	if Input.is_action_just_pressed("jump"):
		change_to_state.emit("wall_jump")
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
	
func physics_process(delta):
	managed_entity.velocity.y = Vector2.DOWN.y * slide_speed
	
func _does_input_dir_match_wall_normal(action_input: StringName, wall_normal: Vector2):
	if action_input == "move_right" and wall_normal.is_equal_approx(Vector2.RIGHT):
		return true
	if action_input == "move_left" and wall_normal.is_equal_approx(Vector2.LEFT):
		return true
	return false
	
