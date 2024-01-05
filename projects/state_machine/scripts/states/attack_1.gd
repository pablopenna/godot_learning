extends State

@export var hitboxes: Array[CollisionShape2D]

func _ready():
	state_name = "attack_1"

func enter():
	print("Entering Attack1")
	
func exit(new_state):
	print("Exiting Attack1")

func process(detla):
	$Area2D.position = managed_entity.position
	$Area2D.scale.x = -1  if managed_entity.facing_direction == FacingDirectionUtils.FacingDirection.LEFT else 1	

func enableHitboxes():
	for hitbox:CollisionShape2D in hitboxes:
		hitbox.disabled = false

func disableHitboxes():
	for hitbox:CollisionShape2D in hitboxes:
		hitbox.disabled = true
		
func finish():
	change_to_state.emit("idle")
	
