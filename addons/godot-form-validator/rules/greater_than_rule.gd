@tool
extends ValidatorRule
class_name GreaterThanRule

@export var target_value: String


func apply(control: Control, value) -> RuleResult:
	if ValidatorFunctions.empty(fail_message):
		fail_message = "The value must be greater than %s." % target_value
	var result = RuleResult.new()
	result.passed = str(value) > target_value
	if not result.passed:
		result.message = fail_message
	return result
