extends LineEdit
class_name NumberConnection

@onready var input :String = self.text.strip_edges();

func _ready() -> void:
	print(getNumEntered());

func _on_text_changed(new_text: String) -> void:
	input = new_text.strip_edges();
	pass

func getNumEntered() -> int:
	if input.strip_edges().is_valid_int() and 0 <= int(input) and int(input) <= 36:
		return int(input);
	else:
		return -1
