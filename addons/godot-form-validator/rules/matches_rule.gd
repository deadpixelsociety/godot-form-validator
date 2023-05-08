@tool
extends ValidatorRule
class_name MatchesRule

@export var pattern: String


func _init() -> void:
	fail_message = "Invalid value."


func apply(control: Control, value) -> RuleResult:
	var result = RuleResult.new()
	if value is String:
		result.passed = ValidatorFunctions.empty(value) or ValidatorFunctions.matches(pattern, value)
	if not result.passed:
		result.message = fail_message
	return result


func is_valid() -> bool:
	return RegEx.create_from_string(pattern).is_valid()


func get_invalid_message() -> String:
	return "Specified regular expression is not valid."
