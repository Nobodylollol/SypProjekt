extends Node
class_name NumberGen

var rng = RandomNumberGenerator.new()
var Result;
@onready var NumCon := $"../NumberInput";
var NumberEntered
signal validateScore
var Probabilities := [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];


func _ready():
	print("Button is Ready")
	NumberEntered = NumCon.getNumEntered();
	

func _on_button_down() -> int:
	
	NumberEntered = NumCon.getNumEntered()
	Result = Probabilities[rng.randi_range(0,Probabilities.size()-1)];
	
	print("Output")
	print("Generated: "+str(Result));
	self.text = str(Result)
	if !(NumberEntered==-1):
		print("Input: "+str(NumberEntered))
	else: 
		print("Selected Other Input")
	emit_signal("validateScore")
	return Result

func getResult() -> int:
	return Result
