extends InteractibleObject


func _interact() -> void:
	var requirements = [
		Inventory.manor_gate_key,
		Inventory.is_gate_key_equipped,
		!Flags.is_manor_gate_open,
	]
	
	if _check_requirements(requirements):
		interactible.open()
		Flags.is_manor_gate_open = true
		return
