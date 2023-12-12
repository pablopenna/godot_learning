extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func receiveDamage():
	$RichTextLabel.text = "Ouch!"
	print("ouch")
	await get_tree().create_timer(2).timeout
	$RichTextLabel.text = "" 

func _on_area_entered(area):
	receiveDamage()
