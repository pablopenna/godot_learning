extends State

var gravity = GravityUtils.get_gravity()

func physics_process(delta):
	if not managed_entity.is_on_floor():
		managed_entity.velocity.y = GravityUtils.get_velocity_applying_gravity(managed_entity.velocity.y, delta)
