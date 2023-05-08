@tool
extends Validator
class_name LineEditValidator


func get_value(control: Control):
	var line_edit = control as LineEdit
	if not line_edit:
		return null
	return line_edit.text


func is_type(node) -> bool:
	return node is LineEdit
