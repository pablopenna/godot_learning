extends Node2D

var targetPosition: Vector2
var navigationAgent2D: NavigationAgent2D
var sprite: Sprite2D

@export
var speed: float

var nextPosition: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	targetPosition = $TargetPosition.position
	navigationAgent2D = $NavigationAgent2D
	sprite = $Sprite2D
	
	navigationAgent2D.target_position = targetPosition

func _physics_process(delta):
	nextPosition = navigationAgent2D.get_next_path_position()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement: Vector2 = (nextPosition - self.position) * speed * delta
	position += movement
	
func print_debug_info():
	print_debug(navigationAgent2D.distance_to_target())
	print_debug(navigationAgent2D.is_target_reachable())
	print_debug(navigationAgent2D.is_target_reached())
	print_debug(navigationAgent2D.velocity)
