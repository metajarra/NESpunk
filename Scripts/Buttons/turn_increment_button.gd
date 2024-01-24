extends Button

@onready var turn_manager : TurnManager = $"/root/turn_manager"

func _ready() -> void:
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	turn_manager.increment_turn()
