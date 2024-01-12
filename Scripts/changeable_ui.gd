extends Control
class_name ChangeableUI

func change_ui_element_text(element_name : String, text : String) -> void:
	var element : Control = get_node(element_name)
	if not element: printerr("Node %s has no child at path %s" % [name, element_name])
	
	element.text = text

func close() -> void:
	self.visible = false
