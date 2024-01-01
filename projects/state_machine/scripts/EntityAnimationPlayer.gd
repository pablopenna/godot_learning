extends AnimationPlayer

func _ready():
	EntityEvents.change_state.connect(_on_change_state)

func _on_change_state(new_state, old_state):
	print("animation; new stata - " + new_state)
	if new_state == "idle":
		play("idle")
	if new_state == "move":
		play("run")
