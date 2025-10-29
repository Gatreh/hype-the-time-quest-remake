extends Node

@export var gogouds_manor_gate_key : bool = false
@export var is_gate_key_equipped : bool = false

var items : Item : set = update_inventory

func update_inventory(new_item : Item) -> Item:
	if new_item.type == Item.ItemTypes.MANOR_GATE_KEY:
		gogouds_manor_gate_key = true
		is_gate_key_equipped = true
	return new_item
