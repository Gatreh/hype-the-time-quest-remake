class_name Quest extends Resource

signal interaction_ready

enum QuestStatus {
	NOT_AVAILABLE,
	AVAILABLE,
	STARTED,
	REACHED_GOAL,
	FINISHED
}

@export var quest_id: String
## What are the lines of dialogue that should appear in each text box that is displayed?
@export var npc_dialogue : Array[String]
@export var quest_status : QuestStatus = QuestStatus.AVAILABLE
## Not implemented yet
@export var auto_start : bool = false
## What items do you want to give the player when they finish this quest?
@export var item_rewards : Array[Item]
## What quests should become available once this quest finishes?
@export var quest_unlocks : Array[Quest]

var textbox_scene : PackedScene = preload("uid://04mxchow3dkj")
var quest_taker : Player

func start(player : Node3D) -> void:
	if not quest_status == QuestStatus.AVAILABLE:
		return
	quest_status = QuestStatus.STARTED
	quest_taker = player
	
	# Text box gets it's own function to decide it's size when it starts
	# Quest provides text for each text box, textbox handles each interaction
	# If the quest has text to start then create a textbox
	var new_box = textbox_scene.instantiate()
	new_box.setup(player, npc_dialogue)
	new_box.text_sequence_finished.connect(func():
		interaction_ready.emit()
	)
	
	quest_taker.add_child(new_box)

func finish() -> void:
	if quest_status == QuestStatus.REACHED_GOAL:
		quest_status = QuestStatus.FINISHED
		_give_rewards()


func reached_goal() -> bool:
	if quest_status == QuestStatus.REACHED_GOAL:
		return true
	else:
		return false


func _give_rewards() -> void:
	if item_rewards.size() > 0:
		for item in item_rewards:
			# create an add_item function to the inventory
			Inventory.items = item
	if quest_unlocks.size() > 0:
		for quest in quest_unlocks:
			quest.quest_status = Quest.QuestStatus.AVAILABLE
