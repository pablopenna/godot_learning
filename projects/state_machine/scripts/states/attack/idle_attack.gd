extends BaseAttackState

func _ready():
	state_name = "idle_attack"

func enter():
	print("Entering Idle Attack")
	
func exit(new_state):
	print("Exiting Idle Attack")
		
func finish():
	change_to_state.emit("idle")
	
