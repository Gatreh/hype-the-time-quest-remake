extends Node3D

var new_position : float = -3.0

@onready var mesh_instance_3d: MeshInstance3D = $MeshInstance3D

func _ready():
	if not Flags.gogouds_manor["is_gate_closed"]:
		mesh_instance_3d.position.y = new_position


func open() -> void:
	var tween : Tween = create_tween()
	tween.tween_property(mesh_instance_3d, "position:x", new_position, 2.0)
