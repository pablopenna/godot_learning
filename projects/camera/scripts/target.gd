extends CharacterBody2D

@export var speed = 100
@onready var screenNotifier = $VisibleOnScreenNotifier2D

func _process(delta):
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.DOWN * speed
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP * speed
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2.LEFT * speed
	if Input.is_action_pressed("ui_right"):
		velocity = Vector2.RIGHT * speed
	move_and_slide()
			
		
