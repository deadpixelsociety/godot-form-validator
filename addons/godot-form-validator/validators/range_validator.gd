@tool
extends Validator
class_name RangeValidator


func get_value(control: Control):
	var range_control = control as Range
	if not range_control:
		return null
	return range_control.value


func is_type(node) -> bool:
	return node is Range and \
		not (node is ScrollBar or node is ProgressBar or node is TextureProgressBar)
