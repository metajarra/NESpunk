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
@onready var ui : ChangeableUI = $"Changeable UI"

func _process(_delta : float) -> void:
	if mouse_over_area.is_mouse_over \
	and mouse_over_area.is_highest \
	and Input.is_action_just_released("click"):
		ui.visible = true
