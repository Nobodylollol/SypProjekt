extends Node
class_name NumberGenerator

var rng = RandomNumberGenerator.new()
var Result;
var Spin_Button;
@onready var NumCon = get_parent().get_node("NumberInput");
@onready var NumberEntered = NumCon.getNumEntered()

func _ready():
	Spin_Button = Button.new()
	Spin_Button.pressed.connect(_SpinButton)
	add_child(Spin_Button)

	print("SpinButton Ready")

	

func _SpinButton():
	Result = rng.randi_range(0,36)
	Spin_Button.text = Result
	print(Result);
	Spin_Button.text = str(Result)
	print(NumCon.getNumEntered())
	return Result
