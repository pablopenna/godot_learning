extends Node2D

@onready
var stateManager: StateManager = $state_manager

func _ready():
	stateManager.change_state.connect(_on_state_change_listen)

func _process(delta):
	if Input.is_action_just_pressed("ui_left"):
		stateManager.change_to_state("move")
	if Input.is_action_just_pressed("ui_right"):
		stateManager.change_to_state("idle")

func _on_state_change_listen(old_state, new_state):
	print("signal received - old state: ", old_state, " new state: ", new_state)
