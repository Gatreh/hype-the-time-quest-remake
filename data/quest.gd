class_name Quest extends Resource

enum QuestStatus {
	NOT_AVAILABLE,
	AVAILABLE,
	STARTED,
	REACHED_GOAL,
	FINISHED
}

const MARGIN : float = 25.0

@export var quest_id: String
@export var npc_dialogue : String 
@export var quest_status : QuestStatus = QuestStatus.AVAILABLE
@export var quest_rewards : Item

var textbox_scene : PackedScene = preload("uid://04mxchow3dkj")
var quest_taker : Player

func start(player : Node3D) -> void:
	if not quest_status == QuestStatus.AVAILABLE:
		return
	quest_status = QuestStatus.STARTED
	quest_taker = player
	
	var new_box = textbox_scene.instantiate()
	new_box.label_text = npc_dialogue
	new_box.size = Vector2(300, 100)
	var screen_size = DisplayServer.window_get_size()
	new_box.position = Vector2(screen_size.x - (new_box.size.x + MARGIN), \
								MARGIN)
	
	quest_taker.add_child(new_box)

func finish() -> void:
	if quest_status == QuestStatus.REACHED_GOAL:
		quest_status = QuestStatus.FINISHED
		_give_rewards()

func _give_rewards() -> void:
	if quest_rewards is Item:
		Inventory.items = quest_rewards
