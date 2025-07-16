class_name Strafe
extends State

var character : CharacterBody3D

const GROUND_ACCEL: float = 15.0
const GROUND_DECEL: float = 20.0

const WALK_SPEED: float = 4.0

const IDLE_THRESHOLD : float = 0.05

func enter() -> void:
	print("entered Strafe")
	
	character.input_dir.y = 0.0


func physics_update(delta) -> void:
	if not character.is_on_floor():
		transitioned.emit(self, "fall")
		return
	
	if character.is_on_floor() and Input.is_action_pressed("jump"):
		transitioned.emit(self, "jump")
		return
	
	if Helper.xor(character.input_dir.x > IDLE_THRESHOLD, character.input_dir.x < -IDLE_THRESHOLD):
		transitioned.emit(self, "idle")
		return
	
	character.input_dir.y = 0.0
	character.input_dir.x = Input.get_axis("strafe_left", "strafe_right")
	
	character.target_speed = WALK_SPEED
	
	if character.direction.length() > 0.0:
		character.current_accel = GROUND_ACCEL
	else:
		character.current_accel = GROUND_DECEL
