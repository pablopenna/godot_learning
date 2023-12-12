### Ideas
* Interpolation -> https://docs.godotengine.org/en/stable/tutorials/math/interpolation.html#smoothing-motion
* More states - Attack
  * Add animations to existing states
  * Implement hitbox - hurtbox system

### Notes
* CharacterController.move_and_slide() already applies delta to velocity -> https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html#moving-the-kinematic-character
* Do not use the scale to affect collision shapes as it can result in unexpected behaviour
