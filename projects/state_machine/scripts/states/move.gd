extends State

@export var speed: float = 50
var target_velocity: Vector2

func _ready():
	state_name = "move"

func enter():
	print("Entering Move")
	
func process(delta):
	if not managed_entity.is_on_floor():
		change_to_state.emit("air")
	
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	
	target_velocity.x = direction.x * speed

	if target_velocity.x == 0:
		change_to_state.emit("idle")
	else:
		managed_entity.velocity = target_velocity
	
func exit(new_state):
	print("Exiting Move")
