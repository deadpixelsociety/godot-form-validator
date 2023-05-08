extends PanelContainer

@onready var form_validator_control: FormValidator = $MarginContainer/FormValidator

func _on_form_validator_control_control_validated(control, passed, messages) -> void:
	var error_label = _get_error_label(control)
	var valid_label = _get_valid_label(control)
	if passed:
		if error_label:
			error_label.hide()
		if valid_label:
			valid_label.show()
	else:
		if error_label:
			error_label.text = ", ".join(messages)
			error_label.show()
		if valid_label:
			valid_label.hide()


func _get_error_label(control: Control) -> Label:
	return find_child(control.name + "Error", true, false) as Label


func _get_valid_label(control: Control) -> Label:
	return find_child(control.name + "Valid", true, false) as Label


func _on_validate_pressed() -> void:
	form_validator_control.validate()


func _on_exit_pressed() -> void:
	get_tree().quit()
