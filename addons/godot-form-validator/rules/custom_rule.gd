@tool
extends ValidatorRule
class_name CustomRule

@export_multiline var expression: String = ""

var _expression: Expression = Expression.new()


func apply(control: Control, value) -> RuleResult:
	var result = RuleResult.new()
	if not _validate_expression():
		result.passed = false
		result.message = "Specified expression is not valid."
		return result
	var res = _expression.execute([ control, value ])
	if _expression.has_execute_failed():
		result.passed = false
		result.message = "Execution of the specified expression has failed."
		return result
	result.passed = res == true
	if not result.passed:
		result.message = fail_message
	return result


func is_valid() -> bool:
	return _validate_expression()


func get_invalid_message() -> String:
	return "Specified expression is not valid."


func _validate_expression() -> bool:
	return _expression.parse(expression, [ "control", "value" ]) == OK
