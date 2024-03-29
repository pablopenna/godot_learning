extends State

func _ready():
	state_name = "idle"

func enter():
	print("Entering Idle")

func process(delta):
	if not managed_entity.is_on_floor():
		change_to_state.emit("air")
	
	if Input.is_action_just_pressed("attack"):
		if Input.is_action_pressed("move_down"):
			change_to_state.emit("blink_attack")
		else:
			change_to_state.emit("idle_attack")
	if Input.is_action_just_pressed("jump"):
		change_to_state.emit("jump")
	if Input.is_action_just_pressed("dash"):
		change_to_state.emit("dash")
	
	if Input.get_axis("move_left", "move_right") != 0:
		change_to_state.emit("move")
	
func exit(new_state):
	print("Exiting Idle")
