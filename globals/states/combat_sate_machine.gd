extends Node

@export var initial_state : State
@export var character : CharacterBody3D

var current_state : State
var states : Dictionary = {}


func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.character = character
			child.transitioned.connect(_on_child_transition)
	if initial_state:
		initial_state.enter()
		current_state = initial_state


func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)


func _on_child_transition(state, new_state_name):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	
	if current_state:
		current_state.exit()
	
	new_state.enter()
	
	current_state = new_state
