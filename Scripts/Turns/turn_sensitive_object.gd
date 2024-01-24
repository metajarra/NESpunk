extends Node
class_name TurnSensitiveObject

func _ready():
	add_to_group("TurnSensitiveObjects")

func next_turn(current_turn : int) -> void:
	print("next turn for " + name)
