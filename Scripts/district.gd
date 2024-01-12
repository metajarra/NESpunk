# Struct
class_name District

enum DistrictType { HOUSING, SPECIAL }
var type : DistrictType

#var resource_output_per_turn : Resources
#const OUTPUT_PER_TURN := 100
#func calculate_output() -> Resources:
	#var resources = Resources.new()
	#match type:
		#OutpostType.COAL:
			#resources.coal = OUTPUT_PER_TURN
		#OutpostType.WOOD:
			#resources.wood = OUTPUT_PER_TURN
		#OutpostType.STEEL:
			#resources.steel = OUTPUT_PER_TURN
	#return resources

var resource_requirement_per_turn : Resources
const ADDITIONAL_REQUIREMENT_PER_PERSON := 1
func calculate_requirement() -> Resources:
	var resources = Resources.new()
	if type == DistrictType.SPECIAL:
		resources.coal = local_population.population * ADDITIONAL_REQUIREMENT_PER_PERSON
	return resources

var local_population : Population
