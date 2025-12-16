extends LineEdit
class_name NumberConnection

var lineedit = LineEdit.new()

var input :String;
func _ready() -> void:
	print(getNumEntered());

func _on_text_changed(new_text: String) -> String:
	new_text = lineedit.text
	return new_text

func getNumEntered() -> int:
	print(input)
	return int(input);
