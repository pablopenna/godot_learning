extends RichTextLabel

@export var monitored_state_manager: StateManager

# Called when the node enters the scene tree for the first time.
func _ready():
	monitored_state_manager.state_changed.connect(_on_state_change)

func _on_state_change(new_state_name: String):
	self.text = new_state_name
