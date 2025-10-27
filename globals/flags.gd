extends Node

var gogouds_manor : Dictionary = {
	"has_gate_key" : false,
	"has_gate_key_equipped" : false,
	"is_gate_closed" : true,
	"interact_edit_flag" : "is_gate_closed"
}

var tutorial_quest : Dictionary = {
	"speak_to_gogoud" : false,
	"hit_training_dummy": {
		"requires" : "speak_to_gogoud",
		"left" : false,
		"right" : false
	},
	"speak_to_gogoud_near_gate" : {
		"requires" : "hit_training_dummy",
		"talk_to_gogoud" : false,
		"reward" : gogouds_manor
	}
}
