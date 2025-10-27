@abstract
class_name Weapon extends Node3D

enum {
	SHEATHED,
	DRAWN,
	ATTACK,
}

@export var projectile_scene : PackedScene

var state_positions : Dictionary = {}
var state_rotations : Dictionary = {}

var state := SHEATHED : set = _set_state


@abstract func _ready() -> void


func attack() -> void:
	state = ATTACK
	var projectile : Projectile = projectile_scene.instantiate()
	add_child(projectile)


func draw() -> void:
	state = DRAWN


func sheathe(character : Player) -> void:
	state = SHEATHED
	character.ActiveWeapon = character.Weapons[character.SWORD]


func _set_state(new_state) -> void:
	state = new_state
	position = state_positions[state]
	rotation_degrees = state_rotations[state]
