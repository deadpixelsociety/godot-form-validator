@tool
extends Validator
class_name TextEditValidator


func get_value(control: Control):
	var text_edit = control as TextEdit
	if not text_edit:
		return null
	return text_edit.text


func is_type(node) -> bool:
	return node is TextEdit
