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
func _process(_delta: float) -> void:
	if is_mouse_over:
		if is_highest:
			(get_node("CollisionShape2D") as CollisionShape2D) \
			.debug_color = Color(1, 0, 0, 0.5)
			return
		(get_node("CollisionShape2D") as CollisionShape2D) \
		.debug_color = Color(0, 1, 0, 0.5)
	else:
		(get_node("CollisionShape2D") as CollisionShape2D) \
		.debug_color = Color(0, 0, 1, 0.5)
#endregion
