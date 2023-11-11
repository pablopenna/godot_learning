extends State

var gravity_magnitude : int = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter():
	print("Entering Idle")

func process(delta):
	if not managed_entity.is_on_floor():
		managed_entity.velocity = Vector2.DOWN * gravity_magnitude
	else:
		managed_entity.velocity = Vector2.ZERO

	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		change_to_state.emit("move")
	
func exit(new_state):
	print("Exiting Idle")
