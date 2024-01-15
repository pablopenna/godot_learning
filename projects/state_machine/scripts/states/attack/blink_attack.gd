extends BaseAttackState

@export var attack_reach = 400
@export var attack_direction = Vector2.RIGHT
@export var teleportation_after_attack_offset = 10

func _ready():
	state_name = "blink_attack"

func enter():
	print("Entering Blink Attack")
	_attack_routine()
	
func exit(new_state):
	print("Exiting Blink Attack")
		
func finish():
	change_to_state.emit("idle")
	
func _attack_routine():
	_scan_hurtboxes()
	finish()

func _scan_hurtboxes():
	var initial_position = managed_entity.global_position
	var direction = 1 if managed_entity.facing_direction == FacingDirectionUtils.FacingDirection.RIGHT else -1
	var target_position = initial_position + (attack_direction.normalized() * attack_reach * direction)
	var result = _query_raycast(initial_position, target_position)
	print(result)
	
	if result and result.has('collider'):
		var hurtbox = result.collider as Hurtbox
		if hurtbox:
			hurtbox.receiveDamage($HitboxData)
	
func _query_raycast(initial_position: Vector2, target_position: Vector2):
	var space = _get_world_2d().direct_space_state
	var collision_mask = PhysicsLayersNamesUtils.get_collision_layer_from_name(
		PhysicsLayersNamesUtils.ENEMY_HURTBOX
	)
	var query = PhysicsRayQueryParameters2D.create(initial_position, target_position, collision_mask, [])
	query.set_collide_with_areas(true)
	return space.intersect_ray(query)
	
func _get_world_2d() -> World2D:
	return managed_entity.get_world_2d() # Need to get it from a CanvasItem


