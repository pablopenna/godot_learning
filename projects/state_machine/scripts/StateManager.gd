class_name StateManager extends Node

@onready var states: Dictionary = get_children_as_state_dictionary()
@onready var current_state: State = initial_state
@export var initial_state: State

func _ready():
	connect_change_state_signal_from_states()

func _process(delta):
	current_state.process()

func _physics_process(delta):
	current_state.physics_process()

func get_children_as_state_dictionary() -> Dictionary:
	var children: Array[Node] = self.get_children()
	var states: Dictionary = {}
	
	for child in children:
		states[child.name] = child as State
		
	return states
	
func connect_change_state_signal_from_states():
	for stateKey in states:
		var state: State = states[stateKey]
		state.change_to_state.connect(on_change_to_state)

func on_change_to_state(new_state_name: String):
	var old_state = current_state
	var new_state = states[new_state_name]
	
	old_state.exit(new_state)
	current_state = new_state
	new_state.enter()
