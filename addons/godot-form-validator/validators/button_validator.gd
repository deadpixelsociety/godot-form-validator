@tool
extends Validator
class_name ButtonValidator


func get_value(control: Control):
	var button = control as Button
	if not button:
		return null
	return button.button_pressed


func is_type(node) -> bool:
	return node is Button
