@tool
extends ValidatorRule
class_name LengthRule

const FAIL_MESSAGE: String = "The value must be between %d and %d characters long."

@export var min_length: int = 0
@export var max_length: int = 9999


func apply(control: Control, value) -> RuleResult:
	var result = RuleResult.new()
	if value is String:
		result.passed = ValidatorFunctions.length(value, min_length, max_length)
	if not result.passed:
		if ValidatorFunctions.empty(fail_message):
			result.message = FAIL_MESSAGE % [ min_length, max_length ]
		else:
			result.message = fail_message
	return result


func is_valid() -> bool:
	return min_length <= max_length


func get_invalid_message() -> String:
	return "Minimum length must be less than or equal to maximum length."
