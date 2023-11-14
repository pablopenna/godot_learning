extends State

var gravity_magnitude : int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	state_name = "air"

func enter():
	print("Entering Air")
	
func exit(newState):
	print("Exiting Air")
	
func process(delta):
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
	
func physics_process(delta):
	managed_entity.velocity.y = Vector2.DOWN.y * gravity_magnitude * delta
