extends Node
class_name CallableEventManager

@onready var signal_bus : SignalBus = $"../Signal Bus"

func _ready() -> void:
	signal_bus.register_observer_method("event_called", _trigger_event, "")

@export var events : Array

func _trigger_event(id : String) -> void:
	print("Event %s called" % id)
	
	# find event
	var event_to_find = null
	for event in events:
		event = event as TriggerableEvent
		if event.id == id:
			event_to_find = event
			break
	
	if event_to_find == null:
		return
	
	# update ui to give event options
