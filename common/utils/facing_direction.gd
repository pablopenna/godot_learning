class_name FacingDirectionUtils

enum FacingDirection {LEFT=-1, RIGHT=1}

static func getFacingDirectionFromVelocityWithDefault(velocity: Vector2, defaultWhenVelocityIsZero: FacingDirection):
	if velocity.x != 0:
		return FacingDirection.LEFT if velocity.x < 0 else FacingDirection.RIGHT
	else:
		return defaultWhenVelocityIsZero

static func getFacingDirectionFromVelocity(velocity: Vector2):
	return getFacingDirectionFromVelocityWithDefault(velocity, FacingDirection.RIGHT)
