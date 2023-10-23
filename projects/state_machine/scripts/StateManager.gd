class_name StateManager extends Node


@onready var states: Dictionary = get_children_as_states()
@export var initial_state: State
@onready var current_state: State = initial_state

signal change_state

func _ready():
	print_debug(states)

func _process(delta):
	current_state.process()

func _physics_process(delta):
	current_state.physics_process()

# Casting of typed arrays (get_children() as Array[State]) does not work properly so need to do it manually.
func get_children_as_states() -> Dictionary:
	var children: Array[Node] = self.get_children()
	var states: Dictionary = {}
	for child in children:
		states[child.name] = child as State
	return states

func change_to_state(new_state_name: String):
	var old_state = current_state
	var new_state = states[new_state_name]
	old_state.exit(new_state)
	current_state = new_state
	new_state.enter()
	emit_signal("change_state", old_state, new_state)
