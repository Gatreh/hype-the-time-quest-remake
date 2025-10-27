class_name NormalAttack extends State


func enter() -> void:
	print("entered Normal Attack")
	character.ActiveWeapon.attack()
	await get_tree().create_timer(0.5).timeout
	character.ActiveWeapon.draw()
	transitioned.emit(self, "combat")
