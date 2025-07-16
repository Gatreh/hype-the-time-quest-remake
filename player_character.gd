extends CharacterBody3D

const TURN_SPEED: float = 4.0

var current_accel : float = 0
var direction : Vector3
var input_dir : Vector2
var target_speed : float = 0

func _ready() -> void:
	floor_snap_length = 0.5

func _physics_process(delta: float) -> void:
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	var target_velocity : Vector3 = direction * target_speed
		
	velocity.x = lerp(velocity.x, target_velocity.x, current_accel * delta)
	velocity.z = lerp(velocity.z, target_velocity.z, current_accel * delta)
	
	var turn_dir := Input.get_axis("look_right", "look_left")
	if turn_dir:
		rotate_y(turn_dir * TURN_SPEED * delta)
	
	move_and_slide()
