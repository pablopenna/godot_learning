extends State

@export var unstick_velocity = 100

func _ready():
	state_name = "wall_unstick"

func enter():
	print("Entering Wall Unstick")
	
func exit(newState):
	print("Exiting Wall Unstick")
	
func process(delta):
	# BUG - managed_entity.is_on_wall() is only true when attached to a wall to the left of the entity
	var unstick_direction = managed_entity.get_wall_normal()
	managed_entity.velocity = unstick_direction * unstick_velocity
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
	else:
		change_to_state.emit("air")
	

	
