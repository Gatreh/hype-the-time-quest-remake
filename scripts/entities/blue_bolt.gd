class_name BlueBolt extends Pickup

func restore(amount : float, player : Node3D) -> void:
	print(str(player) + " picked up " + str(amount) + " " + item.name)

func add_mesh() -> void:
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = item.mesh
	mesh_instance.position.y = $CollisionShape3D.position.y
	
	var material = StandardMaterial3D.new()
	material.albedo_color = Color.ROYAL_BLUE
	mesh_instance.material_override = material
	
	add_child(mesh_instance)











#
