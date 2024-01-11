extends Node
class_name SceneManager

@export var levels : Array[String]
@export_file("*.tscn") var current_level : String

var current_level_node : Node
var current_level_resource : Resource

var transition_player : AnimationPlayer
var load_out_anim_finished : bool

func _ready():
	print("scenemanager ready")
	
	var root : Viewport = get_tree().root
	current_level_node = root.get_child(root.get_child_count() - 1)
	
	# please make sure to follow these naming conventions
#	transition_player = get_tree().root.get_node("SceneTransition/AnimationPlayer")
#	transition_player.animation_finished.connect(on_transition_finished)
#	transition_player.play("level_load_in")

func on_transition_finished(anim_name : StringName):
	if anim_name == "level_load_out": load_out_anim_finished = true

func _process(_delta):
	if current_level_resource == null: return
#	transition_player.play("level_load_out")
	
#	if !load_out_anim_finished: return
	print("loaded resource: %s" % current_level_resource)
	
	current_level_node.queue_free()
	current_level_node = (current_level_resource as PackedScene).instantiate()
	get_tree().root.add_child(current_level_node)
	
	current_level_resource = null
#	load_out_anim_finished = false
	
#	transition_player.play("level_load_in")

func reload_current_level():
	load_level_at_index(levels.find(current_level))

func load_next_level():
	var index : int = levels.find(current_level)
	
	if index >= levels.size() - 1:
		return # temporary - replace with something like load credits
	
	load_level_at_index(index + 1)

func load_previous_level():
	var index : int = levels.find(current_level)
	
	if index <= 0:
		return # temporary - replace with something like load main menu
	
	load_level_at_index(index - 1)

func load_level_at_index(index : int):
	call_deferred("deferred_load_level", levels[index])

func deferred_load_level(level : String):
	current_level_resource = ResourceLoader.load(level)
	print("started loading resource %s" % level)
	
	current_level = level
