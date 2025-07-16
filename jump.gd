class_name Jump
extends State

@export var character : CharacterBody3D

const JUMP_VELOCITY : float = 9.0
const AIR_ACCEL : float = 4.0
const AIR_DECEL : float = 1.5

const AIR_SPEED : float = 5.5

var has_released_forward : bool = false

func enter() -> void:
	print("entered Jump")
	character.velocity.y = JUMP_VELOCITY


func physics_update(delta) -> void:
	if not character.is_on_floor():
		character.velocity += character.get_gravity() * delta
	
	if character.velocity.y < 0.2:
		transitioned.emit(self, "fall")
	
	if character.direction.length() > 0.0:
		character.current_accel = AIR_ACCEL
	else:
		character.current_accel = AIR_DECEL
	
	character.input_dir = Input.get_vector("strafe_left", "strafe_right", "forward", "backward")
	
	if character.input_dir.y >= 0.0:
		character.target_speed = AIR_SPEED
