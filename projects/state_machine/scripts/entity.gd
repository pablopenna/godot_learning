class_name Entity extends CharacterBody2D

enum FacingDirection {LEFT=-1, RIGHT=1}
@onready var facing_direction: FacingDirection = FacingDirection.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	_update_facing_direction()
	# "move_and_slide" already takes delta time into account.
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _update_facing_direction():
	var last_motion_direction = velocity
	if last_motion_direction.x != 0:
		facing_direction = FacingDirection.RIGHT if last_motion_direction.x > 0 else FacingDirection.LEFT
	print(facing_direction)
