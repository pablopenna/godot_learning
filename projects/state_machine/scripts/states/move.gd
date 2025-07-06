extends State

const speed: float = 300
var target_velocity: Vector2

@export var input_buffer: InputBuffer

func _ready():
	state_name = "move"

func enter(_old_state):
	print("Entering Move")
	
func process(delta):
	if not managed_entity.is_on_floor():
		change_to_state.emit("air")
	
	managed_entity.velocity.x = Input.get_axis("move_left", "move_right") * speed
	
	# Input buffer check not needed here as when landing it always goes to IDLE first
	if Input.is_action_just_pressed("jump"):# or input_buffer.should_buffer_jump():
		change_to_state.emit("jump")
		
	if Input.is_action_just_pressed("dash"):
		change_to_state.emit("dash")
	
	if Input.is_action_just_pressed("attack"):
		change_to_state.emit("rush_attack")

	if managed_entity.velocity.x == 0:
		change_to_state.emit("idle")
	
func exit(new_state):
	input_buffer.update_last_ground_time()
	print("Exiting Move")
