class_name Item extends Resource

enum ItemTypes {
	GREEN_GRASS,
	BLUE_BOLT,
	OAK_NUT,
	POTION
}

@export var name : String
@export var type : ItemTypes
@export var icon : Texture2D
@export var mesh : Mesh
@export_category("Stats")
@export_range(0.0, 10.0, 1.0) var restore_amount : float
