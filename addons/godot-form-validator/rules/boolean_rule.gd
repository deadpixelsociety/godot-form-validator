@tool
extends ValidatorRule
class_name BooleanRule

@export var target_value: bool


func apply(control: Control, value) -> RuleResult:
	if ValidatorFunctions.empty(fail_message):
		fail_message = "The value must equal %s." % target_value
	var result = RuleResult.new()
	result.passed = value is bool and value == target_value
	if not result.passed:
		result.message = fail_message
	return result
