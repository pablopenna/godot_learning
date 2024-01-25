extends BaseAttackState

@export var attack_speed: float = 1000
var attack_duration_in_ms: int
@export var attack_distance: float = 200

var attack_start_time_in_ms: int

func _ready():
	super._ready()
	state_name = "rush_attack"

func enter():
	super.enter()
	print("Entering Rush Attack")
	_calculate_attack_duration_from_distance()
	attack_start_time_in_ms = Time.get_ticks_msec()
	enable_hitbox()
	
func exit(_new_state):
	print("Exiting Rush Attack")
	disable_hitbox()
		
func finish():
	managed_entity.velocity.x = 0
	change_to_state.emit("idle")
	
func process(delta):
	var vertical_velocity = 0 if managed_entity.is_on_floor() else (managed_entity.velocity.y + GravityUtils.get_gravity() * delta)
	managed_entity.velocity = Vector2(attack_speed * managed_entity.facing_direction, vertical_velocity)
	
	if(Time.get_ticks_msec() > attack_start_time_in_ms + attack_duration_in_ms):
		finish()
		
func _calculate_attack_duration_from_distance():
	attack_duration_in_ms = (attack_distance / attack_speed) * 1000
