extends Button

## Made visible when this button is pressed
@export var node_to_reveal : Node
## Hidden when this button is pressed
@export var node_to_hide : Node
## Button to focus on press
@export var button_to_focus : Button

func _ready() -> void:
	if pressed.is_connected(_on_pressed): return
	pressed.connect(_on_pressed)

func _on_pressed() -> void:
	if node_to_hide: 
		node_to_hide.visible = false
	if node_to_reveal: 
		node_to_reveal.visible = true
	if button_to_focus:
		button_to_focus.grab_focus()
