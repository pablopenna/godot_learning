extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	EntityEvents.change_state.connect(_on_state_change)

func _on_state_change(new_state_name: String, old_state: String):
	self.text = new_state_name
