extends LineEdit
class_name NumberConnection

@onready var input := self.text.strip_edges();;

func _ready() -> void:
	print("NumberInput is Ready")

func _on_text_changed(new_text:String) -> void:
	input = new_text.strip_edges()
	print("changed")
	pass 

func getNumEntered() -> int:
	if input.is_valid_int():
		return int(input);
	else:
		return -1
