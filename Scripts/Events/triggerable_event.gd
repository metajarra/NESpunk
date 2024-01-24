extends Resource
class_name TriggerableEvent

@export_category("Event Info")
@export var name : String
@export_multiline var text : String
@export var options_and_effects : Dictionary

@export_category("Metadata")
@export var id : String
@export var can_repeat := true
@export var can_be_triggered_randomly := true
