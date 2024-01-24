extends BaseAttackState

@export var attack_direction: Vector2 = Vector2.RIGHT
@export var attack_reach: float = 400
@onready var hitbox_data = $HitboxData

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
	_hurtbox_raycast()
	_teleport()
	finish()

func _hurtbox_raycast() -> void:
	var initial_position = managed_entity.global_position
	var target_position = _get_target_position(initial_position)
	var enemy_layer = PhysicsLayersNamesUtils.get_collision_layer_from_name(PhysicsLayersNamesUtils.ENEMY_HURTBOX)
	var result = RaycastUtils.raycast(initial_position, target_position, enemy_layer)
	var colliders_ignored: Array = []
	
	while(RaycastUtils.does_result_contain_collider(result)):
		print(result)
		colliders_ignored.append(result.rid)
		var hurtbox = Hurtbox.get_hurtbox_from_collider(result.collider)
		if hurtbox:
			hurtbox.receiveDamage(hitbox_data)
			
		result = RaycastUtils.raycast(initial_position, target_position, enemy_layer, colliders_ignored)
	
func _teleport():
	var point_of_collision_with_environment = _environment_raycast()
	var teleport_position = _get_target_position(managed_entity.global_position) if point_of_collision_with_environment == null else point_of_collision_with_environment
	print("tp mv %s" % teleport_position)
	print("global pos: %s" % managed_entity.global_position)
	managed_entity.position = teleport_position

func _environment_raycast():
	var initial_position = managed_entity.global_position
	var target_position = _get_target_position(initial_position)
	var environment_layer = PhysicsLayersNamesUtils.get_collision_layer_from_name(PhysicsLayersNamesUtils.ENVIRONMENT)
	var result = RaycastUtils.raycast(initial_position, target_position, environment_layer)
	
	if RaycastUtils.does_result_contain_collider(result):
		print(result)
		print(result.position)
		return result.position
	print("no ENV COLLISIOn")
	return null
	
func _get_target_position(initial_position):
	var vector_to_be_added = attack_direction.normalized() * attack_reach
	vector_to_be_added.x = vector_to_be_added.x * managed_entity.facing_direction
	return initial_position + vector_to_be_added

