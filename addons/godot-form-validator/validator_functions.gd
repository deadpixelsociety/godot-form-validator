extends Object
class_name ValidatorFunctions


static func matches(pattern: String, text: String) -> bool:
	var regex = RegEx.create_from_string(pattern)
	if not regex.is_valid():
		print_debug("WARNING: Invalid RegEx pattern supplied to matches function: ", pattern)
		return false
	var result = regex.search(text)
	return result != null and result.strings.size() > 0


static func does_not_match(pattern: String, text: String) -> bool:
	var regex = RegEx.create_from_string(pattern)
	if not regex.is_valid():
		print_debug("WARNING: Invalid RegEx pattern supplied to matches function: ", pattern)
		return false
	var result = regex.search(text)
	return result == null


static func not_empty(text: String) -> bool:
	return text != null and not text.is_empty()


static func empty(text: String) -> bool:
	return not not_empty(text)


static func not_blank(text: String) -> bool:
	if text == null:
		return false
	# Remove escape sequences
	text = text.strip_escapes()
	# Remove spaces
	text = text.replace(" ", "")
	return not text.is_empty()


static func alpha(text: String) -> bool:
	var regex = RegEx.create_from_string("[^a-zA-Z]+")
	var result = regex.search(text)
	return result == null


static func numeric(text: String) -> bool:
	var regex = RegEx.create_from_string("[^0-9]+")
	var result = regex.search(text)
	return result == null


static func alphanumeric(text: String) -> bool:
	var regex = RegEx.create_from_string("[^a-zA-Z0-9]+")
	var result = regex.search(text)
	return result == null


static func email(text: String) -> bool:
	var regex = RegEx.create_from_string("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")
	var result = regex.search(text)
	return result != null and result.strings.size() > 0


static func length(text: String, min_length: int = 0, max_length: int = 9999) -> bool:
	return text != null and text.length() >= min_length and text.length() <= max_length
