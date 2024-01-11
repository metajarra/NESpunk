# Struct
class_name District

enum OutpostType { COAL, WOOD, STEEL }
var type : OutpostType

var resource_output_per_turn : Resources
const OUTPUT_PER_TURN := 100
func calculate_output() -> Resources:
	var resources = Resources.new()
	match type:
		OutpostType.COAL:
			resources.coal = OUTPUT_PER_TURN
		OutpostType.WOOD:
			resources.wood = OUTPUT_PER_TURN
		OutpostType.STEEL:
			resources.steel = OUTPUT_PER_TURN
	return resources

var resource_requirement_per_turn : Resources
const REQUIREMENT_PER_PERSON := 5
func calculate_requirement() -> Resources:
	var resources = Resources.new()
	resources.coal = local_population.population * REQUIREMENT_PER_PERSON
	return resources

var local_population : Population
