extends State

func enter():
	print_debug("Entering Move")
	
func process():
	print_debug("MOVE")
	
func exit(new_state):
	print_debug("Exiting Move")
