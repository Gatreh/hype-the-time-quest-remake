class_name Aim extends State

const FIRST_PERSON_POSITION : Vector3 = Vector3(0,1.5,0)
const FIRST_PERSON_ROTATION : Vector3 = Vector3.ZERO

const THIRD_PERSON_POSITION : Vector3 = Vector3(0, 2.7, 2.54)
const THIRD_PERSON_ROTATION : Vector3 = Vector3(deg_to_rad(-19.5), 0, 0)

var animation_time : float = 0.5

var is_attacking : bool


func enter() -> void:
	print("entered Aim")
	character.is_movement_locked = true
	is_attacking = false
	
	var tween = create_tween()
	tween.tween_property(\
			character.camera, "position", FIRST_PERSON_POSITION, animation_time)
	tween.parallel().tween_property(\
			character.camera, "rotation", FIRST_PERSON_ROTATION, animation_time)


func physics_update(_delta) -> void:
	if Input.is_action_just_pressed("aim"):
		transitioned.emit(self, "combat")
		return
	
	if Input.is_action_just_pressed("attack"):
		is_attacking = true
		transitioned.emit(self, "aimattack")
		return


func exit() -> void:
	character.is_movement_locked = false
	
	if not is_attacking:
		var tween = create_tween()
		tween.tween_property(\
				character.camera, "position", THIRD_PERSON_POSITION, animation_time)
		tween.parallel().tween_property(\
				character.camera, "rotation", THIRD_PERSON_ROTATION, animation_time)
