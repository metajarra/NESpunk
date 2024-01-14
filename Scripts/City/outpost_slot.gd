extends TurnSensitiveObject

var deposit : Resources # randomly generated at start

var outpost : Outpost

func add_outpost() -> void:
	var new_outpost := Outpost.new()
	
	new_outpost.resource_output_per_turn = deposit
	
	var new_population := Population.new()
	new_population.population = 100
	new_outpost.local_population = new_population
	
	outpost = new_outpost

@onready var mouse_over_area : MouseOverArea = $"Mouse Over Area"
@onready var ui_node : ChangeableUI = $"Changeable UI"

func _update_ui() -> void:
	ui_node.change_ui_element_text("Info/Title", "OUTPSLOT")
	ui_node.change_ui_element_text("Info/Subtitle", "SUBTITLE/OUTPOST SLOT")
	ui_node.change_ui_element_text("Info/Field1", "RESOURCES/TURN")
	ui_node.change_ui_element_text("Info/Field2", "POPULATION")
	ui_node.change_ui_element_text("Info/Field3", "DISCONTENT")
	
	ui_node.change_ui_element_text("Buttons/Button1", "OPPRESS")
	ui_node.change_ui_element_text("Buttons/Button2", "BUILD")	

func _process(_delta : float) -> void:
	if mouse_over_area.is_mouse_over \
	and mouse_over_area.is_highest \
	and Input.is_action_just_released("click"):
		_update_ui()
		ui_node.visible = true
