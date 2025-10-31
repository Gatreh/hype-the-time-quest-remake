@abstract class_name Pickup extends Area3D

@export var item : Item

@abstract func restore(amount: float, player : Node3D)
@abstract func add_mesh()

func _ready() -> void:
	add_mesh()
	body_entered.connect(_on_body_entered)

func _on_body_entered(body : Node3D) -> void:
	restore(item.restore_amount, body)
