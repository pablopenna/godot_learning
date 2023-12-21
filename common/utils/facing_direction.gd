extends Node

enum FacingDirection {LEFT=-1, RIGHT=1}

func getFacingDirectionFromVelocityWithDefault(velocity: Vector2, defaultWhenVelocityIsZero: FacingDirection):
	if velocity.x != 0:
		return FacingDirection.LEFT if velocity.x < 0 else FacingDirection.RIGHT
	else:
		return defaultWhenVelocityIsZero

func getFacingDirectionFromVelocity(velocity: Vector2):
	return getFacingDirectionFromVelocityWithDefault(velocity, FacingDirection.RIGHT)
