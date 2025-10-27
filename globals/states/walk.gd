class_name Walk
extends State

const IDLE_THRESHOLD : float = 0.1
const RUN_THRESHOLD : float = -0.3

func enter() -> void:
	print("entered Walk")
	character.input_dir.x = 0.0


func physics_update(_delta) -> void:
	
	if not character.is_on_floor():
		transitioned.emit(self, "fall")
		return
	
	if character.is_on_floor() and Input.is_action_pressed("jump"):
		transitioned.emit(self, "jump")
		return
	
	if Helper.xnor(character.input_dir.y < IDLE_THRESHOLD, character.input_dir.y > -IDLE_THRESHOLD):
		transitioned.emit(self, "idle")
		return
	
	if character.input_dir.y < RUN_THRESHOLD:
		transitioned.emit(self, "run")
		return
	
	character.input_dir.y = Input.get_axis("forward", "backward")
	character.input_dir.x = 0.0
	
	character.target_speed = character.WALK_SPEED
	
	if character.direction.length() > 0.0:
		character.current_accel = character.GROUND_ACCEL
	else:
		character.current_accel = character.GROUND_DECEL
