### Ideas
* Interpolation -> https://docs.godotengine.org/en/stable/tutorials/math/interpolation.html#smoothing-motion
* More states - Attack
  * Add animations to existing states
  * Implement hitbox - hurtbox system
* Add camera as common components

### Notes
* CharacterController.move_and_slide() already applies delta to velocity -> https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html#moving-the-kinematic-character
* Do not use the scale to affect collision shapes as it can result in unexpected behaviour
* Autoload scripts need to extend Node as they are added to the global tree behind the scenes -> https://stackoverflow.com/questions/76957945/gdscript-autoload-doesnt-seem-to-be-working
* If experiencing jittering even when FPS is 60, this is an issue with Windows and windowed games. Possible workarounds:
	* Turn off VSync
	* Run game window in exclusive fullscreen so windows gives it priority

### Bugs
* Spamming dash in the state machine scene makes player hover
