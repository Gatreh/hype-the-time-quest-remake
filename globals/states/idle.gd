class_name Idle
extends State

const MOVE_THRESHOLD : float = 0.05

func enter() -> void:
	print("entered Idle")
	character.input_dir = Vector2.ZERO

func physics_update(_delta) -> void:
	if not character.is_on_floor():
		transitioned.emit(self, "fall")
		return
	
	if character.is_movement_locked:
		return
	
	if Input.is_action_just_pressed("jump") and character.is_on_floor():
		transitioned.emit(self, "jump")
		return
	
	if Helper.xor(character.input_dir.y > MOVE_THRESHOLD, character.input_dir.y < -MOVE_THRESHOLD):
		transitioned.emit(self, "walk")
		return
	
	if Helper.xor(character.input_dir.x < MOVE_THRESHOLD, character.input_dir.x > -MOVE_THRESHOLD):
		transitioned.emit(self, "strafe")
		return
	
	character.input_dir = Input.get_vector("strafe_left", "strafe_right", "forward", "backward")
	
	character.target_speed = 0.0
	character.current_accel = character.GROUND_DECEL
