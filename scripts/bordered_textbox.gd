class_name BorderedTextbox extends NinePatchRect

signal text_sequence_finished

const MARGIN : float = 25.0

var label_text : Array[String]
var sequence_step : int = 0
var textbox_owner : Player


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and sequence_step < label_text.size():
		_next_in_sequence()
	elif Input.is_action_just_pressed("interact"):
		textbox_owner.is_movement_locked = false
		text_sequence_finished.emit()
		queue_free()


func setup(player : Player, text_sequence : Array[String]) -> void:
	textbox_owner = player
	player.is_movement_locked = true
	label_text = text_sequence
	
	var screen_size = DisplayServer.window_get_size()
	size = Vector2(screen_size.x / 4, screen_size.y / 6)
	position = Vector2(screen_size.x - (size.x * 2 + MARGIN), MARGIN)
	
	var label_theme : Theme = Theme.new()
	label_theme.default_font_size = 12
	
	var label : Label = Label.new()
	label.size.x = size.x - (patch_margin_left + patch_margin_right)
	label.scale = Vector2.ONE
	label.position = Vector2(patch_margin_left, patch_margin_top)
	label.set_autowrap_mode(TextServer.AUTOWRAP_WORD)
	label.theme = label_theme
	
	add_child(label)
	_next_in_sequence()


func _next_in_sequence() -> void:
	get_child(0).text = label_text[sequence_step]
	sequence_step += 1
