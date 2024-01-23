extends BaseAttackState

@export var attack_direction: Vector2 = Vector2.RIGHT
@export var attack_reach: float = 400
@export var base_teleportation_after_attack_offset: Vector2 = Vector2(100, 0)

func _ready():
	state_name = "blink_attack"

func enter():
	print("Entering Blink Attack")
	_attack_routine()
	
func exit(_new_state):
	print("Exiting Blink Attack")
		
func finish():
	change_to_state.emit("idle")
	
func _attack_routine():
	var hurtbox = _scan_hurtboxes()
	if hurtbox:
		print(hurtbox)
		_apply_damage_to_hurtbox(hurtbox)
		_teleport_opposite_to_target_hurtbox(hurtbox)
	finish()

func _scan_hurtboxes(): # raycast only returns a single result, which is the one it collides with first
	var initial_position = managed_entity.global_position
	var target_position = _get_target_position(initial_position)
	var enemy_layer = PhysicsLayersNamesUtils.get_collision_layer_from_name(PhysicsLayersNamesUtils.ENEMY_HURTBOX)
	var result = RaycastUtils.raycast(initial_position, target_position, enemy_layer)
	print(result)
	
	return _get_hurtbox_in_raycast_result(result)
	
func _apply_damage_to_hurtbox(hurtbox: Hurtbox):
	hurtbox.receiveDamage($HitboxData)
	
func _teleport_opposite_to_target_hurtbox(target: Hurtbox):
	var default_offset = target.global_position + _get_teleportation_after_attack_offset()
	var environment_collision = _check_environment_collision(managed_entity.position, default_offset)
	if environment_collision:
		managed_entity.position.x = environment_collision.x
	else:
		managed_entity.position.x = default_offset.x

func _check_environment_collision(initial_pos: Vector2, target_pos: Vector2):
	var environment_layer = PhysicsLayersNamesUtils.get_collision_layer_from_name(PhysicsLayersNamesUtils.ENVIRONMENT)
	var raycast_result = RaycastUtils.raycast(initial_pos, target_pos, environment_layer)
	
	if RaycastUtils.does_result_contain_collider(raycast_result):
		return raycast_result.position
	return null

func _get_hurtbox_in_raycast_result(raycast_result: Dictionary):
	if RaycastUtils.does_result_contain_collider(raycast_result):
		var hurtbox = raycast_result.collider as Hurtbox
		if hurtbox != null:
			return hurtbox
	return null

func _get_target_position(initial_position):
	var vector_to_be_added = attack_direction.normalized() * attack_reach
	vector_to_be_added.x = vector_to_be_added.x * _get_attack_facing_way()
	
	return initial_position + vector_to_be_added

func _get_attack_facing_way():
	return 1 if managed_entity.facing_direction == FacingDirectionUtils.FacingDirection.RIGHT else -1
	
func _get_teleportation_after_attack_offset():
	var teleportation_offset = base_teleportation_after_attack_offset
	teleportation_offset.x = teleportation_offset.x * _get_attack_facing_way()
	
	return teleportation_offset
