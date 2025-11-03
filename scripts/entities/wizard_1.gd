extends CharacterBody3D

@export var move_location : Array[Marker3D]

var character : Player
var quest_references : Array[Quest] = [Flags.tutorial_quest]

var no_new_quest : String = "bye have a nice trip"
var standard_reply : String = "go do the thing I told you to do first"

var text_box := preload("res://scenes/bordered_textbox.tscn")

@onready var interact_range: Area3D = $InteractRange

func _ready() -> void:
	interact_range.body_entered.connect(_on_body_entered)
	interact_range.body_exited.connect(_on_body_exited)


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and character != null:
		for quest in quest_references:
			if quest.quest_status == quest.QuestStatus.AVAILABLE:
				quest.start(character)
				$InteractRange.monitoring = false
				quest.interaction_ready.connect(func():
					$InteractRange.monitoring = true
				)
				
			elif quest.quest_status == quest.QuestStatus.STARTED:
				var textbox : BorderedTextbox = preload("res://scenes/bordered_textbox.tscn").instantiate()
				var array : Array[String]
				array.append(standard_reply) 
				textbox.setup(character, array)
				$InteractRange.monitoring = false
				textbox.text_sequence_finished.connect(func():
					$InteractRange.monitoring = true
				)
				add_child(textbox)
			
			elif quest.quest_status == quest.QuestStatus.REACHED_GOAL:
				var textbox : BorderedTextbox = preload("res://scenes/bordered_textbox.tscn").instantiate()
				var array : Array[String]
				array.append("Great job sir knight here's the key to my manor.") 
				textbox.setup(character, array)
				$InteractRange.monitoring = false
				textbox.text_sequence_finished.connect(func():
					quest.finish()
					$InteractRange.monitoring = true
				)
				add_child(textbox)
				
				

		# lock players movement
		# Check if there is any active quest stage, if it is then check if the
		# requirements are met, if yes then go to next quest stage.
		# create any textboxes that are needed
		# set up signal to unlock players movement when textbox is queue freed


func _on_body_entered(body : Node3D) -> void:
	if body is Player:
		character = body


func _on_body_exited(body : Node3D) -> void:
	if body is Player:
		character = null
