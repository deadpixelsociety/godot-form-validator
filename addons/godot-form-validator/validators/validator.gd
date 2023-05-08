@tool
extends Resource
class_name Validator

@export var validation_order: int = 1
@export var validation_method: Validation.Method = Validation.Method.BATCH
@export var skip_validation: bool = false
@export var rules: Array[ValidatorRule] = []

var _messages: PackedStringArray = PackedStringArray()


func get_value(control: Control):
	return null


func is_type(node) -> bool:
	return node is Control


func get_messages() -> PackedStringArray:
	return _messages


func validate(control: Control) -> bool:
	_messages.clear()
	var valid = true
	for rule in rules:
		var result = rule.apply(control, get_value(control))
		if not result.passed:
			_messages.append(result.message)
		valid = valid and result.passed
		if not valid:
			# Not BATCH, exit early.
			if validation_method != Validation.Method.BATCH:
				return valid
	return valid
