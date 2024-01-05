extends Node2D

@export var invocationScene: PackedScene
@export var entity_to_get_facing_direction_from: Entity

func _process(delta):
	if Input.is_action_just_pressed("summon"):
			var invocation: Node2D = invocationScene.instantiate()
			invocation.position = entity_to_get_facing_direction_from.position
			if entity_to_get_facing_direction_from.facing_direction == FacingDirectionUtils.FacingDirection.LEFT:
				invocation.scale.x = -1
			get_tree().get_root().add_child(invocation)
