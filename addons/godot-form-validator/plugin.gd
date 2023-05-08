@tool
extends EditorPlugin


func _enter_tree() -> void:
	add_autoload_singleton("Validation", "res://addons/godot-form-validator/validation.gd")
	add_custom_type("FormValidator", "Control", preload("form_validator.gd"), preload("editor_icon.png"))
	add_custom_type("ControlValidator", "Node", preload("control_validator.gd"), preload("editor_icon.png"))


func _exit_tree() -> void:
	remove_custom_type("ControlValidator")
	remove_custom_type("FormValidator")
	remove_autoload_singleton("Validation")
