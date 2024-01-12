extends Button

@onready var scene_manager : SceneManager = get_node("/root/scene_manager")

func _ready() -> void:
	grab_focus()
	if pressed.is_connected(_on_pressed): return
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	scene_manager.load_next_level()
