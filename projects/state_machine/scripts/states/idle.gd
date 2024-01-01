extends State

func _ready():
	state_name = "idle"

func enter():
	print("Entering Idle")

func process(delta):
	if not managed_entity.is_on_floor():
		change_to_state.emit("air")
	
	if Input.is_action_pressed("jump"):
		change_to_state.emit("jump")
		
	if Input.is_action_pressed("dash"):
		change_to_state.emit("dash")
	
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right"):
		change_to_state.emit("move")
	
func exit(new_state):
	print("Exiting Idle")
