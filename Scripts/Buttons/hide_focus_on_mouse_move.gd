extends Node

@onready var signal_bus : SignalBus = $"/root/Control/Signal Bus"

func _ready() -> void:
	signal_bus.register_observer_method("focus_entered", focus_entered, FocusableButton)

var last_focused_button : FocusableButton

func focus_entered(item : FocusableButton) -> void:
	last_focused_button = item

func _input(event: InputEvent) -> void:
	if not last_focused_button: return
	
	if event is InputEventMouseMotion:
		if last_focused_button.has_focus():
			last_focused_button.release_focus()
		return
	
	last_focused_button.grab_focus()
