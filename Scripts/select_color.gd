extends OptionButton

func getSelection() -> int:
	return self.get_selected_id();


func _on_output_ready() -> void:
	print("Color: " + str(getSelection()))
	pass # Replace with function body.
