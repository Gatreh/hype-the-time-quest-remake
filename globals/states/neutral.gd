class_name Neutral
extends State

enum {
	SWORD,
	CROSSBOW
}

func enter() -> void:
	print("entered Neutral")
	if character.ActiveWeapon:
		character.ActiveWeapon.sheathe(character)


func physics_update(_delta) -> void:
	if Input.is_action_just_pressed("combat_mode_toggle"):
		transitioned.emit(self, "combat")
