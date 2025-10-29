class_name BorderedTextbox extends NinePatchRect

@onready var label: Label = $Label
var label_text : String

func _ready() -> void:
	label.text = label_text
