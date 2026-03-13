extends Node
class_name RoundInfo

var base: float = 0
var mult: float = 1
var roundNum: int = 0
var baseScore: float = 1000

func calcScore() -> float:
	var score: float = base * mult
	return score

func addBase(number: float):
	base += number

func addMult(number: float):
	mult += number

func resetBaseAndMult():
	base = 0
	mult = 1

func roundOver():
	roundNum += 1
	resetBaseAndMult()

func calcNeededScore() -> float:
	var neededScore: float = pow(baseScore, pow(1.05, roundNum))
	return neededScore

func isScoreEnough() -> bool:
	var score: float = calcScore()
	return calcNeededScore() <= score
