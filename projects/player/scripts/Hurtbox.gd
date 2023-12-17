extends Area2D

signal damaged

@export_flags_2d_physics var hitbox_collision_layer
@export_flags_2d_physics var hitbox_collision_mask

@export var show_debug_label = false

func _ready():
	collision_layer = hitbox_collision_layer
	collision_mask = hitbox_collision_mask
	if not show_debug_label:
		$RichTextLabel.queue_free()
	
func receiveDamage():
	emit_signal("damaged")
	if show_debug_label:
		$RichTextLabel.text = "Ouch!"
		await get_tree().create_timer(0.1).timeout
		$RichTextLabel.text = ""

func _on_area_entered(area):
	receiveDamage()
