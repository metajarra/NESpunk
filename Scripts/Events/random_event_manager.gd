extends TurnSensitiveObject
class_name RandomEventManager

@onready var signal_bus : SignalBus = $"../Signal Bus"

func _ready() -> void:
	for event in events:
		event = event as TriggerableEvent
		if not event.can_be_triggered_randomly:
			events.erase(event)

@export var events : Array
@onready var rng := RandomNumberGenerator.new()

func next_turn(current_turn : int) -> void:
	var i := rng.randi_range(0, events.size() - 1)
	var event = events[i]
	
	# trigger event
