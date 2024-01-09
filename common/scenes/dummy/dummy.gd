extends Entity

@export var speed = 100
var gravity : int = ProjectSettings.get_setting("physics/2d/default_gravity")

func ready():
	velocity = Vector2.RIGHT * speed

func physics_process(delta):
	if is_on_wall():
		_set_movement_direction(get_wall_normal())
	if not is_on_floor():
		velocity.y += gravity * delta
	
func _set_movement_direction(direction: Vector2):
	velocity = direction * speed

func _on_hurtbox_damaged(hitboxData: HitboxData):
	var current_direction = velocity.normalized().x
	var opposite_direction = current_direction * -1
	_set_movement_direction(Vector2(opposite_direction, 0))
	
	if hitboxData:
		velocity += hitboxData.direction * hitboxData.speed
