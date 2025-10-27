class_name MagicAttack extends State


func enter() -> void:
	print("entered Magic Attack")
	if not character.ActiveMagic == "":
		%AnimationPlayer.play(character.ActiveMagic)
		await %AnimationPlayer.animation_finished


func update(_delta : float):
	if not %AnimationPlayer.is_playing():
		transitioned.emit(self, "combat")


func exit() -> void:
	character.is_movement_locked = false
