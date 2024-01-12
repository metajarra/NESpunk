extends Resource
class_name ReactorValues

var power_level := 1
const MAX_POWER_LEVEL := 5
func increase_power_level() -> void:
	if power_level >= MAX_POWER_LEVEL: return
	power_level += 1
func decrease_power_level() -> void:
	if power_level <= 1: return
	power_level -= 1

var coal_consumption_per_turn := 0
const COAL_FOR_POWER_LEVEL := 100
func calculate_coal_consumption() -> int:
	return COAL_FOR_POWER_LEVEL * power_level * power_level
