extends Node3D

var new_position : float = 3.0

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D


func open() -> void:
	var tween : Tween = create_tween()
	tween.tween_property(mesh_instance_3d, "position:x", new_position, 2.0)
