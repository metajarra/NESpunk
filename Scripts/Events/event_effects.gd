extends Resource
class_name EventEffects

func get_effects() -> Array:
	return [
		population_change,
		hope_change,
		discontent_change,
		coal_change,
		wood_change,
		iron_change,
		custom_change
	]

#region population
@export_category("Population")
@export var population_change : int
@export var hope_change : int
@export var discontent_change : int
#endregion

#region resources
@export_category("Resources")
@export var coal_change : int
@export var wood_change : int
@export var iron_change : int
#endregion

#region special
@export_category("Metadata")
@export var custom_change : int # mainly used in faith vs order event
@export var requirement_flag : String
#endregion
