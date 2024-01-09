class_name Hitbox extends Area2D

@export var hitbox_data: HitboxData

func _ready():
	area_entered.connect(_on_area_entered)
	
func _on_area_entered(area: Area2D):
	var hurtbox = area as Hurtbox
	if hurtbox == null:
		return	
	_on_hurtbox_entered(hurtbox)
		
func _on_hurtbox_entered(hurtbox: Hurtbox):
	hurtbox.receiveDamage(hitbox_data)
	
func enable():
	monitoring = true
	monitorable = true

func disable():
	monitoring = false
	monitorable = false
	
