class_name Sword extends Weapon


func _ready() -> void:
	state_positions = {
		SHEATHED : Vector3(-0.538, 0.893, -0.159),
		DRAWN : Vector3(0.623, 1.401, 0.335),
		ATTACK : Vector3(0.0, 0.765, -0.805),
	}
	
	state_rotations = {
		SHEATHED : Vector3(-33.6, 177.0, 15.0),
		DRAWN : Vector3(38.1, 107.1, 54.9),
		ATTACK : Vector3(0.0, 0.0, 0.0),
	}
