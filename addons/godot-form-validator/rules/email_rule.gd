@tool
extends ValidatorRule
class_name EmailRule


func _init() -> void:
	fail_message = "Value must be a valid email address."


func apply(control: Control, value) -> RuleResult:
	var result = RuleResult.new()
	if value is String:
		result.passed = ValidatorFunctions.empty(value) or ValidatorFunctions.email(value)
	if not result.passed:
		result.message = fail_message
	return result
