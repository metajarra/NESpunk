extends Area2D
class_name MouseOverArea

#region signal bus interaction
@onready var signal_bus : SignalBus = $"/root/Main/Mouse Over Area/Signal Bus"

signal mouse_over

func _ready() -> void:
	signal_bus.register_emitter_signal(mouse_over, "mouse_over", self)
#endregion

#region layer priority
@export var sublayer : int
var sublayer_priority : int

var is_highest := false
#endregion

#region mouse over detection
var is_mouse_over := false

func _on_mouse_entered() -> void:
	is_mouse_over = true
	mouse_over.emit("mouse_over", self)

func _on_mouse_exited() -> void:
	is_mouse_over = false
	mouse_over.emit("mouse_over", self)
#endregion

#region silly debug colours
@onready var sprite : Sprite2D = $"../Sprite2D"

func _process(_delta: float) -> void:
	if is_mouse_over:
		if is_highest:
			sprite.visible = true
			return
		sprite.visible = false
	else:
		sprite.visible = false
#endregion
