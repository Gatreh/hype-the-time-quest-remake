extends Node3D

enum SpinDirection {
	RIGHT,
	LEFT,
}

var left_area_hit : bool = false
var right_area_hit : bool = false

var spin_distance : float = (2.0 * PI) * 2.0
var spinning : bool = false

@onready var left_target: Area3D = %LeftTarget
@onready var right_target: Area3D = %RightTarget


func _ready() -> void:
	left_target.area_entered.connect(_on_left_area_entered)
	right_target.area_entered.connect(_on_right_area_entered)


func spin(direction : SpinDirection) -> void:
	if spinning:
		return
	spinning = true
	var tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	
	if direction == SpinDirection.RIGHT:
		tween.tween_property(self, "rotation:y", rotation.y - spin_distance, 0.8)
	
	if direction == SpinDirection.LEFT:
		tween.tween_property(self, "rotation:y", rotation.y + spin_distance, 0.8)
	
	await tween.finished
	spinning = false

# TODO: Make this so it can set various quests instead of the one quest that exists
# right now, alternatively get more queststages that it will be able to set.
# based on an export.
func set_flag(target : Area3D) -> void:
	if Flags.tutorial_quest.quest_status == Quest.QuestStatus.STARTED:
		if target == %RightTarget:
			right_area_hit = true
		else:
			left_area_hit = true
	
	if right_area_hit and left_area_hit:
		Flags.tutorial_quest.quest_status = Quest.QuestStatus.REACHED_GOAL


func spin_in_direction(area_entered : Area3D, target : Area3D, target_basis) -> void:
	var area_transform = area_entered.global_transform.origin
	var target_transform = target.global_transform.origin
	var relative_vector = target_transform - area_transform
	
	var is_right_target = target == %RightTarget
	var is_in_front = relative_vector.dot(target_basis) > 0
	
	var spin_direction = SpinDirection.LEFT if Helper.xor(is_in_front, is_right_target) \
											else SpinDirection.RIGHT
	
	spin(spin_direction)


func _on_left_area_entered(area : Area3D) -> void:
	if spinning:
		return
	spin_in_direction(area, %LeftTarget, Vector3(-1,0,0))
	set_flag(%LeftTarget)


func _on_right_area_entered(area : Area3D) -> void:
	if spinning:
		return
	spin_in_direction(area, %RightTarget, Vector3(-1,0,0))
	set_flag(%RightTarget)
