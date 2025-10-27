extends InteractibleObject


func _interact() -> void:
	var requirements = Flags.gogouds_manor
	if _check_requirements(requirements):
		requirements[requirements["interact_edit_flag"]] = false
		interactible.open()
		return
