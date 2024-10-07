extends Node2D

@onready var scramblePuzzle = preload("res://Puzzle Scenes/scramble_scene.tscn")
@onready var passwordInterceptionPuzzle = preload("res://Puzzle Scenes/password_interception_scene.tscn")
@onready var colorGridPuzzle = preload("res://Puzzle Scenes/colorGrid_scene.tscn")
@onready var pianoPuzzle = preload("res://Puzzle Scenes/piano_scene.tscn")
@onready var wiresPuzzle = preload("res://Puzzle Scenes/wires_scene.tscn")
var remainingPuzzles
var puzzleInstance
var nextPuzzle
var completedPuzzles = 0

# Called when the node enters the scene tree for the first time.
func _ready():
<<<<<<< Updated upstream
    remainingPuzzles = [pianoPuzzle, colorGridPuzzle, scramblePuzzle, passwordInterceptionPuzzle]
    nextPuzzle = remainingPuzzles.pop_at(randi() % remainingPuzzles.size())
    new_puzzle()
=======
	remainingPuzzles = [wiresPuzzle, passwordInterceptionPuzzle, colorGridPuzzle, pianoPuzzle, wiresPuzzle]
	nextPuzzle = remainingPuzzles.pop_at(randi() % remainingPuzzles.size())
	new_puzzle()
>>>>>>> Stashed changes

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_puzzle():
<<<<<<< Updated upstream
    puzzleInstance = nextPuzzle.instantiate()
    
    if nextPuzzle == passwordInterceptionPuzzle:
        puzzleInstance.completedPuzzles = completedPuzzles
    elif nextPuzzle == pianoPuzzle:
        puzzleInstance.completedPuzzles = completedPuzzles
        puzzleInstance.hexCode = $Background.hexCode
        
    add_child(puzzleInstance)
        
    
    # the following code connects the next_puzzle signal from the
    # newly instantiated puzzle to the _on_next_puzzle function of this script,
    # but only if it has that signal
    var signal_list = puzzleInstance.get_signal_list()
    for signal_entry in signal_list:
        if signal_entry["name"] == "next_puzzle":
            puzzleInstance.next_puzzle.connect(_on_next_puzzle)
        if signal_entry["name"] == "add_strike":
            puzzleInstance.add_strike.connect($Background.add_strike)

func _on_next_puzzle():
    randomize()
    $Background._setBackground()
    puzzleInstance.queue_free()
    completedPuzzles += 1
    if remainingPuzzles.size() > 0:
        nextPuzzle = remainingPuzzles.pop_at(randi() % remainingPuzzles.size())
        new_puzzle()
        $Background/PuzzleCounter.text = str(completedPuzzles)
    else:
        get_tree().change_scene_to_file("res://Other Scenes/win_screen.tscn")
=======
	puzzleInstance = nextPuzzle.instantiate()
	
	if nextPuzzle == passwordInterceptionPuzzle:
		puzzleInstance.completedPuzzles = completedPuzzles
	elif nextPuzzle == pianoPuzzle:
		puzzleInstance.completedPuzzles = completedPuzzles
		puzzleInstance.hexCode = $Background.hexCode
		
	add_child(puzzleInstance)
	
	'''
	if nextPuzzle == wiresPuzzle:
		puzzleInstance.get_node("Wire1").add_strike.connect($Background.add_strike)
		puzzleInstance.get_node("Wire2").add_strike.connect($Background.add_strike)
		puzzleInstance.get_node("Wire3").add_strike.connect($Background.add_strike)
		puzzleInstance.get_node("Wire4").add_strike.connect($Background.add_strike)
	'''
		
	
	# the following code connects the next_puzzle signal from the
	# newly instantiated puzzle to the _on_next_puzzle function of this script,
	# but only if it has that signal
	var signal_list = puzzleInstance.get_signal_list()
	for signal_entry in signal_list:
		if signal_entry["name"] == "next_puzzle":
			puzzleInstance.next_puzzle.connect(_on_next_puzzle)
		if signal_entry["name"] == "add_strike":
			puzzleInstance.add_strike.connect($Background.add_strike)
		if signal_entry["name"] == "correct":
			puzzleInstance.correct.connect(_on_correct)

func _on_correct():
	$SFX.stream = correctSound
	$SFX.play()

func _on_next_puzzle():
	$SFX.stream = solveSound
	$SFX.play()
	randomize()
	$Background._setBackground()
	puzzleInstance.queue_free()
	completedPuzzles += 1
	if remainingPuzzles.size() > 0:
		nextPuzzle = remainingPuzzles[randi() % remainingPuzzles.size()]
		new_puzzle()
		$Background/PuzzleCounter.text = str(completedPuzzles)
	else:
		get_tree().change_scene_to_file("res://Other Scenes/win_screen.tscn")
>>>>>>> Stashed changes
