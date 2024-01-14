# Struct
class_name District

var deposit : Resources

enum DistrictType { MINING, HOUSING, SPECIAL }
var type : DistrictType

var resource_output_per_turn : Resources
const OUTPUT_PER_TURN := 100
func calculate_output() -> Resources:
	var resources = Resources.new()
	if type == DistrictType.MINING:
		resources.coal = clamp(resources.coal, 0, 1) * OUTPUT_PER_TURN
		resources.wood = clamp(resources.wood, 0, 1) * OUTPUT_PER_TURN
		resources.steel = clamp(resources.steel, 0, 1) * OUTPUT_PER_TURN
	return resources

var resource_requirement_per_turn : Resources
const ADDITIONAL_REQUIREMENT_PER_PERSON := 1
func calculate_requirement() -> Resources:
	var resources = Resources.new()
	if type == DistrictType.SPECIAL:
		resources.coal = local_population.population * ADDITIONAL_REQUIREMENT_PER_PERSON
	return resources

var local_population : Population
