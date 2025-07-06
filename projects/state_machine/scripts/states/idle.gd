extends State

@export var input_buffer: InputBuffer

func _ready():
	state_name = "idle"

func enter(_old_state):
	print("Entering Idle")

func process(delta):
	if not managed_entity.is_on_floor():
		change_to_state.emit("air")
	
	if Input.is_action_just_pressed("attack"):
		if Input.is_action_pressed("move_down"):
			change_to_state.emit("blink_attack")
		else:
			change_to_state.emit("idle_attack")
	
	if Input.get_axis("move_left", "move_right") != 0:
		change_to_state.emit("move")
		
	if Input.is_action_just_pressed("dash"):
		change_to_state.emit("dash")
	
	# ORDER MATTERS: placing this at the end makes it override any other state changes in this function that happened in the same frame
	if Input.is_action_just_pressed("jump") or input_buffer.should_buffer_jump():
		change_to_state.emit("jump")
	
func exit(new_state):
	print("Exiting Idle")
