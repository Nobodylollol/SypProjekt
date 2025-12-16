extends Node
class_name NumberGen

var rng = RandomNumberGenerator.new()
var Result;
var Spin_Button;
@onready var NumCon = $"../NumberInput";
var NumberEntered


func _ready():
	Spin_Button = Button.new()
	add_child(Spin_Button)
	print("Button is Ready")
	NumberEntered = NumCon.getNumEntered();
	

func _on_button_down() -> int:
	NumberEntered = NumCon.getNumEntered()
	Result = rng.randi_range(0,36)
	
	print("Output")
	print("Generated: "+str(Result));
	Spin_Button.text = str(Result)
	print("Input: "+str(NumberEntered))
	return Result
