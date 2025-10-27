class_name Combat
extends State


func enter() -> void:
	print("entered Combat")
	character.ActiveWeapon.draw()


func physics_update(_delta: float) -> void:
	if Input.is_action_just_pressed("combat_mode_toggle"):
		transitioned.emit(self, "neutral")
		return
	
	if Input.is_action_just_pressed("attack"):
		transitioned.emit(self, "normalattack")
		return
	
	if Input.is_action_just_pressed("use_magic") \
			and %WalkStateMachine.current_state.name.to_lower() == "idle":
		transitioned.emit(self, "magicattack")
		return
	
	if Input.is_action_just_pressed("aim") \
			and character.ActiveWeapon == character.Weapons[character.CROSSBOW] \
			and %WalkStateMachine.current_state.name.to_lower() == "idle":
		transitioned.emit(self, "aim")
		return
	
	if Input.is_action_just_pressed("swap_weapon"):
		# Change the active weapon between sword or crossbow
		var active_weapon = character.Weapons[character.SWORD] \
				if character.ActiveWeapon == character.Weapons[character.CROSSBOW] \
				else character.Weapons[character.CROSSBOW]
		
		character.ActiveWeapon.sheathe(character)
		character.ActiveWeapon = active_weapon
		character.ActiveWeapon.draw()
	
	if Input.is_action_just_pressed("swap_active_spell"):
		return
