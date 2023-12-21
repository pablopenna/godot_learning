class_name Entity extends CharacterBody2D

@onready var facing_direction = FacingDirectionUtils.FacingDirection.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	_update_facing_direction()
	# "move_and_slide" already takes delta time into account
	move_and_slide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _update_facing_direction():
	facing_direction = FacingDirectionUtils.getFacingDirectionFromVelocityWithDefault(velocity, facing_direction)
