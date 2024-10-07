extends Node2D

signal next_puzzle
signal add_strike

# Instantiate Codes and Scrambles
var scrambleWords = [
	"MALTED","LAMENT","TANGLE",
	"LAMEST","LABELS","LAPSED",
	"TASTED","LADDER","MALLET","TABLET"
]
var solutions = [
	[["NOWS" , 1], ["SPOT" , 2], ["TEAL" , 6]],
	[["TSAR" , 5], ["LATE" , 6], ["OWNS" , 1]],
	[["TILLS", 4], ["RATS" , 5], ["SATE" , 3]],
	[["SNOW" , 1], ["LIST" , 4], ["TOPS" , 2]],
	[["STOPS", 2], ["TEASE", 3], ["LATTE", 6]],
	[["SLIT" , 4], ["EAST" , 3], ["TALE" , 6]],
	[["WONS" , 1], ["SEAT" , 3], ["TILTS", 4]],
	[["SOWN" , 1], ["POTS" , 2], ["ARTS" , 5]],
	[["EATS" , 3], ["START", 5], ["ELATE", 6]],
	[["POSTS", 2], ["SILT" , 4], ["TARS" , 5]],
]
var solutionLetters = [
	["N", "O", "S", "W"],
	["O", "P", "S", "T"],
	["A", "E", "S", "T"],
	["I", "L", "S", "T"],
	["A", "R", "S", "T"],
	["A", "E", "L", "T"],
]

var codeEntered = ""
var codeFinal = ""
var code1 = ""
var code2 = ""
var code3 = ""
var code4 = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Generate Screen Word and Code Word
	var scrmWord = randi() % 10
	var codeWord = randi() % 3
	var scrmText = scrambleWords[scrmWord]
	codeFinal = solutions[scrmWord][codeWord][0]
	
	# Scramble Screen Word
	var finalText = ""
	var letterNum
	for n in range(6):
		letterNum = randi() % scrmText.length()
		finalText += scrmText[letterNum]
		scrmText = scrmText.substr(0, letterNum) + scrmText.substr(letterNum + 1, scrmText.length() - letterNum - 1)
	$Node2D/LetterScramble/LetterText.text = finalText
	
	# Generate Button Letters
	var currentLetters = solutionLetters[solutions[scrmWord][codeWord][1] - 1]
	for n in range(4):
		letterNum = randi() % currentLetters.size()
		match n:
			0:
				code1 = currentLetters[letterNum]
				$Node2D/Button1/Text.text = code1
			1:
				code2 = currentLetters[letterNum]
				$Node2D/Button2/Text.text = code2
			2:
				code3 = currentLetters[letterNum]
				$Node2D/Button3/Text.text = code3
			3:
				code4 = currentLetters[letterNum]
				$Node2D/Button4/Text.text = code4
		currentLetters.remove_at(letterNum)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#region ButtonSignals
func pressedCode1(code1 : String, passID : String) -> void:
	addLetter(code1)
	pass
	
func pressedCode2(code1 : String, passID : String) -> void:
	addLetter(code2)
	pass

func pressedCode3(code1 : String, passID : String) -> void:
	addLetter(code3)
	pass

func pressedCode4(code1 : String, passID : String) -> void:
	addLetter(code4)
	pass
#endregion ButtonSignals

func addLetter(letter : String) -> void:
<<<<<<< Updated upstream
    codeEntered += letter
    var tempCodeFinal = codeFinal.substr(0, codeEntered.length())
    if (codeEntered == codeFinal):
        # SUCCESS AND MOVE ON
        print("SUCCESS")
        next_puzzle.emit()
    elif (codeEntered == tempCodeFinal):
        print("Good")
    else:
        # RESET AND ADD FAILURE
        print("FAILED")
        codeEntered = ""
        add_strike.emit()
    pass
=======
	codeEntered += letter
	var tempCodeFinal = codeFinal.substr(0, codeEntered.length())
	if (codeEntered == codeFinal):
		# SUCCESS AND MOVE ON
		print("SUCCESS")
		next_puzzle.emit()
	elif (codeEntered == tempCodeFinal):
		print("Good")
		correct.emit()
	else:
		# RESET AND ADD FAILURE
		print("FAILED")
		codeEntered = ""
		add_strike.emit()
	pass
>>>>>>> Stashed changes
