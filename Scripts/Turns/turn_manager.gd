extends Node
class_name TurnManager

# using a singleton here bc fuck it we ball

var _current_turn := 0

func increment_turn() -> void:
	get_tree().call_group("TurnSensitiveObjects", "next_turn", _current_turn)
	_current_turn += 1
