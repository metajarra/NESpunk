extends FocusableButton

func _ready() -> void:
	super._ready()
	
	if pressed.is_connected(_on_pressed): return
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	get_tree().quit()
