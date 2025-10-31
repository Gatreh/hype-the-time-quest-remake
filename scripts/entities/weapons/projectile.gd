class_name Projectile extends Area3D


@export var visuals : MeshInstance3D

@export var speed : float = 10.0
@export var max_range : float = 10.0

var _traveled_distance : float = 0.0

func _physics_process(delta) -> void:
	var distance : float = speed * delta
	var motion := -transform.basis.z * distance
	
	position += motion
	_traveled_distance += distance
	if _traveled_distance > max_range:
		queue_free()

# function for destroying the projectile visuals once they're implemented instead
# of a simple mesh
func destroy() -> void:
	pass
