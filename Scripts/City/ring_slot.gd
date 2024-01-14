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
@onready var ui : ChangeableUI = $"Changeable UI"

func _process(_delta : float) -> void:
	if mouse_over_area.is_mouse_over \
	and mouse_over_area.is_highest \
	and Input.is_action_just_released("click"):
		ui.visible = true
