@tool
extends ValidatorRule
class_name RequiredRule


func _init():
	fail_message = "A value is required."


func apply(control: Control, value) -> RuleResult:
	var result = RuleResult.new()
	if value is String:
		result.passed = ValidatorFunctions.not_blank(value)
	else:
		result.passed = value != null
	if not result.passed:
		result.message = fail_message
	return result
