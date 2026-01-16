extends Node

@onready var NumGen 		:= $"../SpinButton"
@onready var NumInput 		:= $"../NumberInput"
@onready var OptionCol 		:= $"../ColorSelect"
@onready var OptionDoz		:= $"../SelectDozen"
@onready var OptionOddEven	:= $"../SelectOddEven"
@onready var OptionHalf		:= $"../SelectHalf"
@onready var OptionColumn	:= $"../SelectRow"

const BLACK := [2,4,6,8,10,11,13,15,17,20,22,24,26,28,31,33,35]
const RED 	:= [1,3,5,7,9,12,14,16,18,19,21,23,25,27,30,32,34,36];

const ROWS	:= 	[	
					[1,4,7,10,13,16,19,22,25,28,31,34],
					[2,5,8,11,14,17,20,23,26,29,32,35],
					[3,6,9,12,15,18,21,24,27,30,33,36]
				]

const COLUMNS :Array[Array] =[	
								[01,02,03],[04,05,06],[07,08,09],[10,11,12],
								[13,14,15],[16,17,18],[19,20,21],[22,23,24],
								[25,26,27],[28,29,30],[31,32,33],[34,35,36]
							 ]

func _on_spin_button_validate_score() -> int:
	var input = NumGen.getResult();
	self.text=""
	if input==NumInput.getNumEntered():
		self.text="	You've guessed the right number\n
							Calculating score"
		return 1;
		
	elif checkForColorWithInt(input) == checkForColorWithStr(str(OptionCol.getSelection())):
		self.text= "	You've guessed the right color\n
							Calculating score"
							
	elif checkForThird(input)==checkForThirdWithId():
		self.text=	"You've guessed the right Third \n
					Calculating score"
	elif checkForOddEven(input) == checkForOddEvenWithId():
		self.text=	"You've guessed the right parity \n
							Calculating Score"
	elif checkForRow(input) == checkForRowWithId():
		self.text=	"You've guessed the right Row \n
							Calculating Score"
	
	return -1 

func checkForColorWithInt(Check :int)		->	String:
	if Check==0:
		return "GREEN"
	if !(RED.find(Check)==-1):
		return "RED"
	elif !(BLACK.find(Check)==-1):
		return "BLACK" 
	return "ERR"

func checkForColorWithStr(Check :String)	->	String:
	if Check=="3":
		return "GREEN"
	elif Check=="2":
		return "RED"
	elif Check=="1":
		return "BLACK" 
	return "-1"	

func checkForThird(input:int)	->	int:
	if   1  <= input && input <= 12:
		return 1;
	elif 13 <= input && input <= 24:
		return 2;
	elif 25 <= input && input <= 36:
		return 3;
	return -1

func checkForThirdWithId()		->	int:
	if OptionDoz.getSelection() != 0:
		return OptionDoz.getSelection()
	return -1

func checkForOddEven(input:int)	->	int:
	if !(OptionOddEven.getSelection())==0:
		return input % 2;
	else:
		return 2;
	

func checkForOddEvenWithId()	->	int:
		if OptionOddEven.getSelection() == 1:
			return 1
		elif OptionOddEven.getSelection() == 2:
			return 0
		else:
			return -1;

func checkForHalf(input:int)	->	int:
	if 		0 <= input && input <= 18:
		return 0
	elif	19 <= input && input <= 36:
		return 1 
	return -1

func checkForHalfWithId()		->	int:
	if OptionHalf.getSelection() == 1:
		return 0
	elif OptionHalf.getSelection() == 0:
		return 1
	else:
		return -1

func checkForRow(input:int)		->	int:
	if ROWS[0].find(input)!=-1:
		return 1
	elif ROWS[1].find(input)!=-1:
		return 2
	elif ROWS[2].find(input)!=-1:
		return 3
	return -1

func checkForRowWithId()		->	int:
	if OptionColumn.getSelection() != 0:
		return OptionColumn.getSelection()
	else:
		return -1
