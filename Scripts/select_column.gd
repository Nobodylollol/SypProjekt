extends LineEdit
class_name Column

@onready var input :String = self.text.strip_edges();

func _on_text_changed(new_text: String) -> void:
	input = new_text.strip_edges();
	pass

func getNumEntered() -> int:
	if input.strip_edges().is_valid_int():
		return int(input);
	else:
		return -1
