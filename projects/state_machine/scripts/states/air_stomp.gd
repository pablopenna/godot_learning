extends State

@export var down_speed = 600

func _ready():
	state_name = "air_stomp"

func enter():
	print("Entering Air Stomp")
	
func exit(newState):
	print("Exiting Air Stomp")
	
func process(delta):
	if Input.is_action_pressed("dash"):
		change_to_state.emit("dash")
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
	
func physics_process(delta):
	managed_entity.velocity.y = Vector2.DOWN.y * down_speed
