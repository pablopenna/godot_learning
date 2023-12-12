extends Node2D

func _ready():
	$AnimationPlayer.play("dark_knight")
	
func _destroy():
	queue_free()
