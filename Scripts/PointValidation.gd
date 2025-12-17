extends Node

@onready var NumGen 	:= $"../SpinButton"
@onready var NumInput 	:= $"../NumberInput"
@onready var OptionCol 	:= $"../ColorSelect"

const BLACK := [2,4,6,8,10,11,13,15,17,20,22,24,26,28,31,33,35]
const RED 	:= [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36]

func _on_spin_button_validate_score() -> int:
	self.text=""
	if NumGen.getResult()==NumInput.getNumEntered():
		self.text="	You've guessed the right number\n
					Calculating score"
		return 1;
		
	if checkForColorWithInt(NumGen.getResult()) == checkForColorWithStr(str(OptionCol.getSelection())):
		self.text= "	You've guessed the right color\n
							Calculating score"
	return -1 

func checkForColorWithInt(Check :int) -> String:
	if Check==0:
		return "GREEN"
	if !(RED.find(Check)==-1):
		return "RED"
	elif !(BLACK.find(Check)==-1):
		return "BLACK" 
	return "ERR"
	
func checkForColorWithStr(Check :String) -> String:
	if Check=="0":
		return "GREEN"
	elif Check=="2":
		return "RED"
	elif Check=="1":
		return "BLACK" 
	return "ERR"	

func checkForThird()->int:
	if   1  <= NumGen.getResult() <= 12:
		return 1;
	elif 13 <= NumGen.getResult() <= 24:
		return 2;
	elif 25 <= NumGen.getResult() <= 26:
		return 3;
	return -1
