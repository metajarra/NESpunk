extends Node
class_name Ring

@export var needed_heat_level := 1
var current_heat_level := 0

var districts : Dictionary

func add_district(slot : int, type : District.DistrictType) -> void:
	if districts.has(slot):
		return # slot already occupied
	
	var new_district = District.new()
	new_district.type = type
	
	var new_district_dict = { slot : new_district }
	
	districts.merge(new_district_dict)
	print("Districts in ring %s: %s" % [name, districts])

func change_district(slot : int, type : District.DistrictType) -> void:
	if not districts.has(slot):
		return # slot not occupied
	
	var district : District = districts[slot]
	
	if district.type == type:
		return # already that type
	
	district.type = type
