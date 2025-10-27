class_name Strafe
extends State

const IDLE_THRESHOLD : float = 0.05

func enter() -> void:
	print("entered Strafe")
	
	character.input_dir.y = 0.0


func physics_update(_delta) -> void:
	if not character.is_on_floor():
		transitioned.emit(self, "fall")
		return
	
	if character.is_on_floor() and Input.is_action_pressed("jump"):
		transitioned.emit(self, "jump")
		return
	
	if Helper.xnor(character.input_dir.x > IDLE_THRESHOLD, character.input_dir.x < -IDLE_THRESHOLD):
		transitioned.emit(self, "idle")
		return
	
	character.input_dir.y = 0.0
	character.input_dir.x = Input.get_axis("strafe_left", "strafe_right")
	
	character.target_speed = character.WALK_SPEED
	
	if character.direction.length() > 0.0:
		character.current_accel = character.GROUND_ACCEL
	else:
		character.current_accel = character.GROUND_DECEL
