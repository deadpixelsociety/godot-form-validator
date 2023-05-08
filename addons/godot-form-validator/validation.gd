@tool
extends Node

signal validator_added(control, validator)
signal validator_removed(control)

enum Method {
	# Processes all validators and rules before returning a result.
	BATCH,
	# Processes validators until a rule failure is encountered, then proceeds to the next validator.
	FAIL_FAST,
	# Processes validators until a rule failure is encountered and returns immediately.
	IMMEDIATE
}

var _validators: Array[Validator] = []


func _ready() -> void:
	add_validator(ButtonValidator.new())
	add_validator(LineEditValidator.new())
	add_validator(RangeValidator.new())
	add_validator(TextEditValidator.new())


func add_validator(validator: Validator) -> void:
	if not _validators.has(validator):
		_validators.append(validator)


func get_validators() -> Array[Validator]:
	return _validators


func find_validator(node: Node) -> Validator:
	for validator in get_validators():
		if validator.is_type(node):
			return validator
	return null
