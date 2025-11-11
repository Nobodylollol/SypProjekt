extends Node

var rng = RandomNumberGenerator.new()
var Result = 0;
var Spin_Button;

func _ready():
	Spin_Button = Button.new()
	Spin_Button.pressed.connect(_SpinButton)
	add_child(Spin_Button)
	

func _SpinButton():
	Result = rng.randi_range(0,36)
	Spin_Button.text = Result
	return Result
