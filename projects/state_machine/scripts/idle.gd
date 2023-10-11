extends State

func enter():
	print_debug("Entering Idle")
	
func process():
	print_debug("IDLE")
	
func exit(new_state):
	print_debug("Exiting Idle")
