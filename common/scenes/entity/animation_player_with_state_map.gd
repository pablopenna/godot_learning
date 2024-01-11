extends AnimationPlayer

func _on_change_state(new_state, old_state):
	match new_state:
		"idle":
			play("idle")
		"move":
			play("run")
		"attack_1":
			play("attack")
		_:
			play("default")
