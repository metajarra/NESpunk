extends Node
class_name SignalBus

func _add_signal_with_name(signal_name : String, args = null) -> void:
	for item in get_signal_list():
		if item.name == signal_name:
			return
	
	var _args = null
	if typeof(args) == TYPE_ARRAY:
		_args = args
	else:
		_args = [args]
	
	if args != null:
		add_user_signal(signal_name, _args)
	else:
		add_user_signal(signal_name)

func _receive_signal_call(signal_name : String, args = null) -> void:
	if args != null:
		emit_signal(signal_name, args)
	else:
		emit_signal(signal_name)

func register_emitter_signal(signal_to_connect : Signal, signal_name : String, args = null) -> void:
	_add_signal_with_name(signal_name, args)
	signal_to_connect.connect(_receive_signal_call)

func register_observer_method(signal_name : String, method_to_connect : Callable, args = null) -> void:
	_add_signal_with_name(signal_name, args)
	connect(signal_name, method_to_connect)
