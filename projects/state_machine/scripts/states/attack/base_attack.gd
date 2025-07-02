class_name BaseAttackState extends State

var hitbox: Hitbox
	
func _ready():
	_find_hitbox_in_children()

func enter(_old_state):
	_set_entity_on_hitbox()

func enable_hitbox():
	hitbox.enable()

func disable_hitbox():
	hitbox.disable()

func _find_hitbox_in_children():
	hitbox = find_children("*", "Hitbox")[0]
	
# This cannot be called on _ready because at the time it is executed, managed_entity is null.
# This is because the _ready function is first called in the children and then on the parent.
#
# Because the managed_entity is set in StateManager, which is the parent of the states,
# At the time the states run their _ready function, managed_entity is null.
#
# This needs to be called in enter() instead
func _set_entity_on_hitbox(): 
	hitbox.entity_to_track = managed_entity
