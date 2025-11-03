extends Node3D

enum SpinDirection {
	RIGHT,
	LEFT,
}

var spun_left : bool = false
var spun_right : bool = false

var spin_distance : float = (2.0 * PI) * 2.0
var spinning : bool = false

@onready var left_target: Area3D = %LeftTarget
@onready var right_target: Area3D = %RightTarget


func _ready() -> void:
	left_target.area_entered.connect(_on_left_area_entered)
	right_target.area_entered.connect(_on_right_area_entered)

func spin(direction : SpinDirection) -> void:
	print("Starting Spin")
	if spinning:
		return
	spinning = true
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	
	if direction == SpinDirection.RIGHT:
		print("Direction is right!")
		tween.tween_property(self, "rotation:y", rotation.y - spin_distance, 0.8)
	
	if direction == SpinDirection.LEFT:
		print("Direction is left!")
		tween.tween_property(self, "rotation:y", rotation.y + spin_distance, 0.8)
	
	await tween.finished
	spinning = false


func _on_left_area_entered(area : Area3D) -> void:
	spin(SpinDirection.LEFT)
	spun_left = true
	if spun_left and spun_right:
		Flags.tutorial_quest.quest_status = Quest.QuestStatus.REACHED_GOAL
		print(Flags.tutorial_quest.quest_status)
	area.queue_free()


func _on_right_area_entered(area : Area3D) -> void:
	spin(SpinDirection.RIGHT)
	spun_right = true
	if spun_left and spun_right:
		Flags.tutorial_quest.quest_status = Quest.QuestStatus.REACHED_GOAL
		print(Flags.tutorial_quest.quest_status)
	area.queue_free()
