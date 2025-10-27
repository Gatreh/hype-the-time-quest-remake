class_name Crossbow extends Weapon

@onready var aim_reticle_ray : RayCast3D = %CrossbowAim


func _ready() -> void:
	state_positions = {
		SHEATHED : Vector3(0.389, 1.189, 0.462),
		DRAWN : Vector3(0.623, 1.151, 0.335),
		ATTACK : Vector3(0.0, 0.765, -0.805),
	}
	
	state_rotations = {
		SHEATHED : Vector3(-34.8, 92.4, 77.7),
		DRAWN : Vector3(53.5, -41.6, 21.3),
		ATTACK : Vector3(0.0, 0.0, 0.0),
	}


func draw() -> void:
	state = DRAWN
	aim_reticle_ray.enabled = true


func sheathe(character : Player) -> void:
	state = SHEATHED
	character.ActiveWeapon = character.Weapons[character.SWORD]
	aim_reticle_ray.enabled = false
	
