extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var invocationScene: PackedScene
var facing_direction = FacingDirectionUtils.FacingDirection.RIGHT

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("dash"):
		var invocation: Node2D = invocationScene.instantiate()
		invocation.position = position
		if facing_direction == FacingDirectionUtils.FacingDirection.LEFT:
			invocation.scale.x = -1
		get_tree().get_root().add_child(invocation)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Update facing direction
	facing_direction = FacingDirectionUtils.getFacingDirectionFromVelocity(velocity, facing_direction)

	move_and_slide()
