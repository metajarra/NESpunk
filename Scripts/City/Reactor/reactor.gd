extends TurnSensitiveObject
class_name Reactor

@export var reactor_values : ReactorValues
@export var storage : ResourceStorage

func _ready() -> void:
	reactor_values.coal_consumption_per_turn = reactor_values.calculate_coal_consumption()

func next_turn(_current_turn : int) -> void:
	reactor_values.coal_consumption_per_turn = reactor_values.calculate_coal_consumption()
	if storage.resources.coal < reactor_values.coal_consumption_per_turn:
		printerr("Not enough coal! Game over")
		return # replace with game over handler
	storage.resources.coal -= reactor_values.coal_consumption_per_turn

@onready var ui_node : ChangeableUI = $"UI"
@onready var mouse_over_area_node : MouseOverArea = $"Mouse Over Area"

func _update_ui() -> void:
	reactor_values.coal_consumption_per_turn = reactor_values.calculate_coal_consumption()
	ui_node.change_ui_element_text("Info/Power level", "PWR: %s" % reactor_values.power_level)
	ui_node.change_ui_element_text("Info/Coal consumption", "COAL: %s" % reactor_values.coal_consumption_per_turn)

func _process(_delta: float) -> void:
	_update_ui()
	
	if mouse_over_area_node.is_mouse_over \
	and mouse_over_area_node.is_highest \
	and Input.is_action_just_released("click"):
		ui_node.visible = true

func increase_power_level() -> void:
	reactor_values.increase_power_level()
	_update_ui()

func decrease_power_level() -> void:
	reactor_values.decrease_power_level()
	_update_ui()
