extends CharacterBody2D

@export var speed = 100

func _ready():
	velocity = Vector2.RIGHT * speed

func _physics_process(delta):
	if is_on_wall():
		_set_movement_direction(get_wall_normal())
	move_and_slide()
	
func _set_movement_direction(direction: Vector2):
	velocity = direction * speed

func _on_hurtbox_damaged():
	var current_direction = velocity.normalized().x
	var opposite_direction = current_direction * -1
	_set_movement_direction(Vector2(opposite_direction, 0))
