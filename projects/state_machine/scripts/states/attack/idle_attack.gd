extends BaseAttackState

func _ready():
	super._ready()
	state_name = "idle_attack"

func enter():
	super.enter()
	print("Entering Idle Attack")
	
func exit(new_state):
	print("Exiting Idle Attack")
		
func finish():
	change_to_state.emit("idle")
	
