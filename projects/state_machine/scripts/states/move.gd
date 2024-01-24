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
	
	managed_entity.velocity.x = Input.get_axis("move_left", "move_right") * speed
	
	if Input.is_action_just_pressed("jump"):
		change_to_state.emit("jump")
		
	if Input.is_action_just_pressed("dash"):
		change_to_state.emit("dash")
	
	if Input.is_action_just_pressed("attack"):
		change_to_state.emit("rush_attack")

	if managed_entity.velocity.x == 0:
		change_to_state.emit("idle")
	
func exit(new_state):
	print("Exiting Move")
