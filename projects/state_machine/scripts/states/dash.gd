extends State

@export var dash_speed = 250
@onready var dash_duration: Timer = $duration
@onready var dash_cooldown: Timer = $cooldown
var did_dash: bool

func _ready():
	state_name = "dash"
	dash_duration.timeout.connect(_finish_dash)
	
func enter():
	print("Entering Dash")
	did_dash = false
	if _is_dash_ready():
		_start_dash()
	else:
		_finish_dash()

func exit(new_state):
	print("Exiting Dash")
	
func process(delta):
	managed_entity.velocity = Vector2(managed_entity.facing_direction * dash_speed, 0)

func _is_dash_ready() -> bool:
	return dash_cooldown.is_stopped()
	
func _start_dash():
	dash_duration.start()
	did_dash = true
	
func _finish_dash():
	if did_dash:
		managed_entity.velocity = Vector2.ZERO
	
	if dash_cooldown.is_stopped():
		dash_cooldown.start()

	if !managed_entity.is_on_floor():
		change_to_state.emit("air")
	else:
		change_to_state.emit("idle")
	
