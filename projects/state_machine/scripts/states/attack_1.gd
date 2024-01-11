extends State

@export var hitbox: Hitbox

func _ready():
	state_name = "attack_1"

func enter():
	print("Entering Attack1")
	
func exit(new_state):
	print("Exiting Attack1")

func process(_delta):
	hitbox.position = managed_entity.position
	hitbox.scale.x = -1 \
	if managed_entity.facing_direction == FacingDirectionUtils.FacingDirection.LEFT \
	else 1	

func enableHitboxes():
	hitbox.enable()

func disableHitboxes():
	hitbox.disable()
		
func finish():
	change_to_state.emit("idle")
	
