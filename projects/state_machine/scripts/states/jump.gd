extends State

@export var jump_speed = 500

func _ready():
	state_name = "jump"
	
func enter():
	print("Entering Jump")
	managed_entity.velocity.y = Vector2.UP.y * jump_speed
	change_to_state.emit("air")

func exit(new_state):
	print("Exiting Jump")
