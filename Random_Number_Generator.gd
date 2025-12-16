extends Node
var rng = RandomNumberGenerator.new()
var Result;
var Spin_Button;
var NumCon = NumberConnection.new();
var NumberEntered = NumCon.getNumEntered()


func _ready():
	Spin_Button = Button.new()
	add_child(Spin_Button)
	print("Button Ready")
	

func _on_button_down() -> int:
	Result = rng.randi_range(0,36)
	print(Result);
	Spin_Button.text = str(Result)
	print(NumberEntered)
	
	return Result
