extends State

@export var speed: float = 200
var target_velocity: Vector2

func _ready():
	state_name = "move"

func enter():
	print("Entering Move")
	
func process(delta):
	if not managed_entity.is_on_floor():
		change_to_state.emit("air")

	target_velocity.x = 0
	if Input.is_action_pressed("move_right"):
		target_velocity.x = Vector2.RIGHT.x + speed
	if Input.is_action_pressed("move_left"):
		target_velocity.x = Vector2.LEFT.x * speed
	
	managed_entity.velocity = target_velocity
	
	if Input.is_action_pressed("jump"):
		change_to_state.emit("jump")

	if target_velocity.x == 0:
		change_to_state.emit("idle")
	
func exit(new_state):
	print("Exiting Move")
