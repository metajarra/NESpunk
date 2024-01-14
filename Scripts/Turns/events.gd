extends TurnSensitiveObject

var rng = RandomNumberGenerator.new()

@export var hope_and_discontent: Node

func _ready():
	super._ready()
	rng.randomize()

func next_turn():
	if rng.randi_range(0,1) > 0:
		print("event happened")
		print("hope is now"+str(hope_and_discontent.change_hope(20)))
	else:
		print("event did not happen")
