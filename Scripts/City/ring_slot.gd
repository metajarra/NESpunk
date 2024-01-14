extends TurnSensitiveObject

@onready var slot : int = get_index() + 1
@onready var ring : Ring = $".."

func build_house() -> void:
	add_district(District.DistrictType.HOUSING)

func build_mine() -> void:
	add_district(District.DistrictType.MINING)

func add_district(type : District.DistrictType) -> void:
	ring.add_district(slot, type)
	
@onready var mouse_over_area : MouseOverArea = $"Mouse Over Area"
@onready var ui_node : ChangeableUI = $"/root/Main/Changeable UI"

func _update_ui() -> void:
	ui_node.change_ui_element_text("Info/Title", "SLOT")
	ui_node.change_ui_element_text("Info/Subtitle", "SUBTITLE FOR SLOT")
	ui_node.change_ui_element_text("Info/Field1", "POPULATION")
	ui_node.change_ui_element_text("Info/Field2", "")
	ui_node.change_ui_element_text("Info/Field3", "")
	
	ui_node.change_ui_element_text("Buttons/Button1", "BUILD HOUSING")
	ui_node.change_ui_element_text("Buttons/Button2", "BUILD MINING")	

func _process(_delta : float) -> void:
	if mouse_over_area.is_mouse_over \
	and mouse_over_area.is_highest \
	and Input.is_action_just_released("click"):
		_update_ui()
		ui_node.visible = true
