@tool
extends Resource
class_name ValidatorRule

@export var fail_message: String = ""


func apply(control: Control, value) -> RuleResult:
	return RuleResult.new()


func is_valid() -> bool:
	return true


func get_invalid_message() -> String:
	return ""
