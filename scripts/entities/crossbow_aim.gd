extends RayCast3D

@onready var decal : Decal = $Decal

func _process(_delta) -> void:
	if enabled and is_colliding():
		decal.visible = true
		decal.global_transform.origin = get_collision_point()
	else:
		decal.visible = false
