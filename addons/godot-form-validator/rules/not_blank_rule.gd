@tool
extends ValidatorRule
class_name NotBlankRule


func _init() -> void:
	fail_message = "Value must not be blank."


func apply(control: Control, value) -> RuleResult:
	var result = RuleResult.new()
	if value is String:
		result.passed = ValidatorFunctions.not_blank(value)
	if not result.passed:
		result.message = fail_message
	return result
