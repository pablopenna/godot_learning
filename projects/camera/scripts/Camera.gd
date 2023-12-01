extends Camera2D

@export var target: Node2D

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("NOT VISIBLE!")
	self.position = target.position
