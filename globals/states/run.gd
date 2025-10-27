class_name Run
extends State

const WALK_THRESHOLD : float = -0.2

func enter() -> void:
	print("entered Run")


func physics_update(_delta) -> void:
	
	if character.input_dir.y > WALK_THRESHOLD:
		transitioned.emit(self, "walk")
		return
	
	if character.is_on_floor() and Input.is_action_just_pressed("jump"):
		transitioned.emit(self, "jump")
		return
	
	if not character.is_on_floor():
		transitioned.emit(self, "fall")
		return
	
	if character.direction.length() > 0.0:
		character.current_accel = character.GROUND_ACCEL
	else:
		character.current_accel = character.GROUND_DECEL
	
	character.input_dir.y = Input.get_axis("forward", "backward")
	character.input_dir.x = 0.0
	character.target_speed = character.RUN_SPEED
