# Struct
class_name Outpost

var resource_output_per_turn : Resources
const OUTPUT_PER_TURN := 100

var resource_requirement_per_turn : Resources
const REQUIREMENT_PER_PERSON := 5
func calculate_requirement() -> Resources:
	var resources = Resources.new()
	resources.coal = local_population.population * REQUIREMENT_PER_PERSON
	return resources

var local_population : Population
