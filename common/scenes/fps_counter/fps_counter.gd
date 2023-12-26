extends RichTextLabel

func _ready():
	position = get_viewport_rect().position

func _process(delta):
	text = "%s" % Engine.get_frames_per_second()
