extends Button

func _ready() -> void:
	if pressed.is_connected(_on_pressed): return
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	get_tree().quit()
