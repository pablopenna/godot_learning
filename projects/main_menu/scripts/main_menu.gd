extends Node
@export var window_size: Vector2 = Vector2(800, 600)
@export var camera_scene: PackedScene
@export var state_machine_scene: PackedScene
@export var path_finding_scene: PackedScene
@export var player_scene: PackedScene

func _ready():
	# _set_screen_size(window_size)
	pass
	
func _set_screen_size(size: Vector2):
	get_viewport().get_window().size = size

func _on_camera_pressed():
	get_tree().change_scene_to_packed(camera_scene)

func _on_state_machine_pressed():
	get_tree().change_scene_to_packed(state_machine_scene)

func _on_path_finding_pressed():
	get_tree().change_scene_to_packed(path_finding_scene)

func _on_player_pressed():
	get_tree().change_scene_to_packed(player_scene)
