class_name BaseAttackState extends State

@export var hitbox: Hitbox

func enableHitboxes():
	hitbox.enable()

func disableHitboxes():
	hitbox.disable()
