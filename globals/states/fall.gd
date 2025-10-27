class_name Fall
extends State


func enter() -> void:
	print("entered Fall ")
	character.target_speed = character.AIR_SPEED


func physics_update(delta) -> void:
	
	if character.is_on_floor():
		transitioned.emit(self, "idle")
	
	character.velocity += character.get_gravity() * 2 * delta
	
	if character.direction.length() > 0.0:
		character.current_accel = character.AIR_ACCEL
	else:
		character.current_accel = character.AIR_DECEL
	
	character.input_dir = Input.get_vector("strafe_left", "strafe_right", "forward", "backward")
