@tool
extends ValidatorRule
class_name NumericRule


func _init() -> void:
	fail_message = "Value must contain only numbers."


func apply(control: Control, value) -> RuleResult:
	var result = RuleResult.new()
	if value is String:
		result.passed = ValidatorFunctions.empty(value) or ValidatorFunctions.numeric(value)
	if not result.passed:
		result.message = fail_message
	return result
