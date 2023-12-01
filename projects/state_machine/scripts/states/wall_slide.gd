extends State

@export var slide_speed = 10
@export var wall_jump_speed = 300

func _ready():
	state_name = "wall_slide"

func enter():
	print("Entering Wall Slide")
	
func exit(newState):
	print("Exiting Wall Slide")
	
func process(delta):
	
	if Input.is_action_pressed("jump"):
		var jump_direction = managed_entity.get_wall_normal().normalized()
		managed_entity.velocity = jump_direction * wall_jump_speed
		change_to_state.emit("air")
		
	if managed_entity.is_on_floor():
		change_to_state.emit("idle")
	
func physics_process(delta):
	managed_entity.velocity.y = Vector2.DOWN.y * slide_speed
	
