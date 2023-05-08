@tool
extends ValidatorRule
class_name NotEmptyRule


func _init() -> void:
	fail_message = "Value must not be empty."


func apply(control: Control, value) -> RuleResult:
	var result = RuleResult.new()
	if value is String:
		result.passed = ValidatorFunctions.not_empty(value)
	if not result.passed:
		result.message = fail_message
	return result
