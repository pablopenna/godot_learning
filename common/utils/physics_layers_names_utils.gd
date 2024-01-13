extends Node # To be set as a global script as it needs to initialize

#region names_enum (not declared as enum because enums must have int value)
const PLAYER = "player"
const ENVIRONMENT = "environment"
const ENEMY = "enemy"
const PLAYER_ATTACK = "player_attack"
const ENEMY_ATTACK = "enemy_attack"
#endregion

var _layers_dict: Dictionary

func _init():
	_load_layer_names()
	print(_layers_dict)

func _load_layer_names():
	for i in range(32):
		var layer_index = i + 1
		var layer = ProjectSettings.get_setting("layer_names/2d_physics/layer_%s" % layer_index)
		if layer:
			_layers_dict[layer] = pow(2, i)
		
func get_collision_layer_from_name(name: StringName):
	push_error("Collision layer named %s does not exist" % name)
	return _layers_dict[name]
