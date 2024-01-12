extends Node
class_name TurnSensitiveObject

func _ready():
	add_to_group("TurnSensitiveObjects")

func next_turn() -> void:
	print("next turn for "+self.get_name())
