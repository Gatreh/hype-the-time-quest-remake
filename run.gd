class_name Run
extends State

@export var character : CharacterBody3D

const GROUND_ACCEL : float = 15.0
const GROUND_DECEL : float = 20.0

const RUN_SPEED : float = 12.5

const WALK_THRESHOLD : float = -0.2

func enter() -> void:
	print("entered Run")


func physics_update(delta) -> void:
	
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
		character.current_accel = GROUND_ACCEL
	else:
		character.current_accel = GROUND_DECEL
	
	character.input_dir.y = Input.get_axis("forward", "backward")
	character.input_dir.x = 0.0
	character.target_speed = RUN_SPEED
