extends Button
class_name FocusableButton

signal focus_entered_by_button_navigation

@export var signal_bus : SignalBus

func _ready() -> void:
	signal_bus.register_emitter_signal(focus_entered_by_button_navigation, "focus_entered", self)
	focus_entered.connect(_on_focus_entered)

func _on_focus_entered() -> void:
	focus_entered_by_button_navigation.emit("focus_entered", self)
