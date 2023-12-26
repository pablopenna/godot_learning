extends Node2D

@onready var main_menu_scene = load("res://projects/main_menu/scenes/main_menu.tscn")

func _unhandled_input(event: InputEvent):
	if event.is_action_released("ui_cancel"):
		get_tree().change_scene_to_packed(main_menu_scene)
