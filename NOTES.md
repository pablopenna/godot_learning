
### Notes
* CharacterController.move_and_slide() already applies delta to velocity -> https://docs.godotengine.org/en/stable/tutorials/physics/kinematic_character_2d.html#moving-the-kinematic-character
* Do not use the scale to affect collision shapes if possible, as it can result in unexpected behaviour
* Autoload scripts need to extend Node as they are added to the global tree behind the scenes -> https://stackoverflow.com/questions/76957945/gdscript-autoload-doesnt-seem-to-be-working
* If experiencing jittering even when FPS is 60, this is an issue with Windows and windowed games. Possible workarounds:
	* Turn off VSync and set max FPS
	* Run game window in exclusive fullscreen so windows gives it priority

* Style guide - https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html

### Bugs

### Ideas

### Tasks
- [ ] Proof of Concepts 
  * [ ] Camera that follows Node2D scene
  * [ ] Navigation Entity
    Entity that creates a mesh of navigation nodes detecting terrain (so it does not create nodes within the environment). Then, given a point or Entity (player), it moves towards them by traversing the environment.
    * [ ] Without gravity
    * [ ] With gravity
 
- [ ] States
  * [ ] More attacks
    * [ ] Stinger/dash forward attack
      Im implement an attack that makes the entity move forward with the hitbox active
    * [ ] Teleport/blink attack
      Attack that teleports the entity certain distance in a direction and then activates hitbox. Ideally the distance would be reduced if colliding with the environment or a hurtbox

- [ ] Learning new things
  * [ ] Interpolation -> https://docs.godotengine.org/en/stable/tutorials/math/interpolation.html#smoothing-motion

