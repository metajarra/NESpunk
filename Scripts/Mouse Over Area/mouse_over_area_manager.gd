extends Node
class_name MouseOverAreaManager

@onready var signal_bus : SignalBus = $"/root/Main/Mouse Over Area/Signal Bus"

var detection_areas : Array[Node]

func _ready() -> void:
	signal_bus.register_observer_method("mouse_over", _on_mouse_over, MouseOverArea)
	
	detection_areas = get_tree().get_nodes_in_group("mouse_detection_areas")
	var i := 0
	
	for area in detection_areas:
		area = area as MouseOverArea
		area.sublayer_priority = i
		i += 1

func _on_mouse_over(area_over : MouseOverArea) -> void:
	var total_mouse_over_areas : Array[Node]
	
	for area in detection_areas:
		area = area as MouseOverArea
		if area.is_mouse_over:
			total_mouse_over_areas.append(area)
	
	# no other areas with mouse over
	if total_mouse_over_areas == [area_over]:
		area_over.is_highest = true
		return
	
	# some other area with mouse over
	if total_mouse_over_areas.size() == 0:
		return
	
	# no errors
	var area_with_highest_priority : MouseOverArea
	for area in total_mouse_over_areas:
		area = area as MouseOverArea
		
		area.is_highest = false
		
		if not area_with_highest_priority \
		or area.sublayer_priority > area_with_highest_priority.sublayer_priority:
			area_with_highest_priority = area
	
	area_with_highest_priority.is_highest = true
