class_name Jump
extends State

var has_released_forward : bool = false

func enter() -> void:
	print("entered Jump")
	character.velocity.y = character.JUMP_VELOCITY


func physics_update(delta) -> void:
	if not character.is_on_floor():
		character.velocity += character.get_gravity() * delta
	
	if character.velocity.y < 0.2:
		transitioned.emit(self, "fall")
	
	if character.direction.length() > 0.0:
		character.current_accel = character.AIR_ACCEL
	else:
		character.current_accel = character.AIR_DECEL
	
	character.input_dir = Input.get_vector("strafe_left", "strafe_right", "forward", "backward")
	
	if character.input_dir.y >= 0.0:
		character.target_speed = character.AIR_SPEED
