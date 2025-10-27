@abstract class_name InteractibleObject extends Area3D
## A base class for interactible objects meant to be extended so any Are3D can 
## easily be made to interact with other things
##
## This should be mainly used for locks, buttons, levers, doors and the race torches.
## Basically anything that isn't an NPC and you need to use the interact button to 
## activate.

## This is the main export for linking the thing that is used to interact with.
## Example: Doors, Gates, Save points, time travel sundial
@export var interactible : Node

## A reference to the character ocnce it enters the area.
var character : CharacterBody3D

## Main function to implement interact logic in the inherited class
@abstract func _interact() -> void


func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


func _physics_process(_delta) -> void:
	if character == null:
		return
	
	if Input.is_action_just_pressed("interact"):
		_interact()


## Iterates through a dictionary of flags to check if the required flags are set
## for the interaction to happen.
# Might refactor this to have the ability to do a certain amount of checks.
func _check_requirements(requirements : Dictionary) -> bool:
	print("Checking requirements")
	for key in requirements:
		print(key + ": " + str(requirements[key]))
		if not requirements[key]:
			print("ACCESS DENIED")
			return false
	print("ACCESS GRANTED")
	return true


func _on_body_entered(body : Node3D) -> void:
	character = body


func _on_body_exited(body : CharacterBody3D):
	if body == character:
		character = null
