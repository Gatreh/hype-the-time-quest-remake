class_name Player
extends CharacterBody3D

enum {
	SWORD,
	CROSSBOW
}

const AIR_ACCEL : float = 4.0
const AIR_DECEL : float = 1.5
const GROUND_ACCEL: float = 15.0
const GROUND_DECEL: float = 20.0

const AIR_SPEED : float = 5.5
const RUN_SPEED : float = 12.5
const TURN_SPEED: float = 4.0
const WALK_SPEED: float = 4.0

const JUMP_VELOCITY : float = 9.0

@export var is_movement_locked : bool = false
@export var target_speed : float = 0
@export var Weapons : Array[Weapon]

var current_accel : float = 0
var direction : Vector3
var input_dir : Vector2

var ActiveWeapon : Weapon
var ActiveMagic : String = "magic_fire_beam"
 
@onready var character_mesh : MeshInstance3D = %CharacterMesh
@onready var camera: Camera3D = $CharacterCamera
@onready var crossbow_aim: RayCast3D = %CrossbowAim
@onready var static_body_3d: StaticBody3D = $totallymagictrust

func _ready() -> void:
	floor_snap_length = 0.5
	static_body_3d.get_node("./CollisionShape3D").disabled = true
	for weapon in Weapons:
		weapon.sheathe(self)

func _physics_process(delta: float) -> void:
	if %AnimationPlayer.is_playing():
		input_dir.y = 1.0
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	var target_velocity : Vector3 = direction * target_speed
	
	velocity.x = lerp(velocity.x, target_velocity.x, current_accel * delta)
	velocity.z = lerp(velocity.z, target_velocity.z, current_accel * delta)
	
	var turn_dir := Input.get_axis("look_right", "look_left")
	if turn_dir:
		rotate_y(turn_dir * TURN_SPEED * delta)
	
	move_and_slide()


func set_color(new_color : Color) -> void:
	character_mesh.mesh.material.albedo_color = new_color


func set_magic_active() -> void:
	if static_body_3d.visible:
		static_body_3d.hide()
		static_body_3d.get_node("./CollisionShape3D").disabled = true
	else:
		static_body_3d.show()
		static_body_3d.get_node("./CollisionShape3D").disabled = false
