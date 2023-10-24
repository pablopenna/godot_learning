extends State

func enter():
	print("Entering Idle")
	
func process():
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		change_to_state.emit("move")
	
func exit(new_state):
	print("Exiting Idle")
