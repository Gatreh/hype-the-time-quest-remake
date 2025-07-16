class_name Fall
extends State

@export var character : CharacterBody3D

const AIR_ACCEL : float = 4.0
const AIR_DECEL : float = 1.5

const AIR_SPEED : float = 5.5


func enter() -> void:
	print("entered Fall ")
	character.target_speed = AIR_SPEED


func physics_update(delta) -> void:
	
	if character.is_on_floor():
		transitioned.emit(self, "idle")
	
	character.velocity += character.get_gravity() * 2 * delta
	
	if character.direction.length() > 0.0:
		character.current_accel = AIR_ACCEL
	else:
		character.current_accel = AIR_DECEL
	
	character.input_dir = Input.get_vector("strafe_left", "strafe_right", "forward", "backward")
