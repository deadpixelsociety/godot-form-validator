@tool
extends Node
class_name ControlValidator

@export var validator: Validator:
	set(value):
		validator = value
		_on_validator_added()


func _ready() -> void:
	tree_entered.connect(_on_tree_entered)
	tree_exiting.connect(_on_tree_exiting)
	_configure_validator()
	_on_validator_added()


func _configure_validator() -> void:
	if validator != null:
		return
	var parent = get_parent()
	if not parent:
		return
	var found = Validation.find_validator(parent)
	if found:
		validator = found.duplicate(true)
	else:
		validator = Validator.new()


func _get_configuration_warnings() -> PackedStringArray:
	if not validator:
		return []
	var list = PackedStringArray()
	for rule in validator.rules:
		if not rule.is_valid():
			list.append(rule.get_invalid_message())
	return list


func _on_tree_entered() -> void:
	_configure_validator()
	_on_validator_added()


func _on_tree_exiting() -> void:
	_on_validator_removed()


func _on_validator_added() -> void:
	var parent = get_parent()
	if not parent or not validator:
		return
	Validation.validator_added.emit(parent, validator)
	update_configuration_warnings()


func _on_validator_removed() -> void:
	var parent = get_parent()
	if not parent:
		return
	Validation.validator_removed.emit(parent)
