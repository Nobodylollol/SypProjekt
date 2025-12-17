extends Node
class_name NumberGen

var rng = RandomNumberGenerator.new()
var Result;
@onready var NumCon := $"../NumberInput";
var NumberEntered
signal validateScore


func _ready():
	print("Button is Ready")
	NumberEntered = NumCon.getNumEntered();
	

func _on_button_down() -> int:
	
	NumberEntered = NumCon.getNumEntered()
	Result = rng.randi_range(0,36)
	
	print("Output")
	print("Generated: "+str(Result));
	self.text = str(Result)
	print("Input: "+str(NumberEntered))
	emit_signal("validateScore")
	return Result

func getResult() -> int:
	return Result
