extends Node

@export var base_hope: int
@export var base_discontent: int

var hope: int = 0
var discontent: int = 0

func _ready():
	hope = base_hope
	discontent = base_discontent

func change_hope(value: int):
	hope += value
	if hope > 100:
		hope = 100
	if hope < 0:
		hope = 0
	return hope
	
func change_discontent(value: int):
	discontent += value
	if discontent > 100:
		discontent = 100
	if discontent < 0:
		discontent = 0
	return discontent
	
func get_hope():
	return hope

func get_discontent():
	return discontent
