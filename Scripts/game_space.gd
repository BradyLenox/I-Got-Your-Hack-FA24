extends Node2D

@onready var scramblePuzzle = preload("res://Puzzle Scenes/scramble_scene.tscn")
@onready var passwordInterceptionPuzzle = preload("res://Puzzle Scenes/password_interception_scene.tscn")
@onready var colorGridPuzzle = preload("res://Puzzle Scenes/colorGrid_scene.tscn")
@onready var pianoPuzzle = preload("res://Puzzle Scenes/piano_scene.tscn")
@onready var wiresPuzzle = preload("res://Puzzle Scenes/wires_scene.tscn")
@onready var correctSound = preload("res://Assets/Sound/Correct.mp3")
@onready var solveSound = preload("res://Assets/Sound/Win.mp3")
@onready var gameOverScene = preload("res://Other Scenes/game_over.tscn")
var remainingPuzzles
var puzzleInstance
var nextPuzzle
var completedPuzzles = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	remainingPuzzles = [wiresPuzzle, passwordInterceptionPuzzle, colorGridPuzzle, pianoPuzzle, scramblePuzzle]
	#remainingPuzzles = [wiresPuzzle]
	#nextPuzzle = remainingPuzzles.pop_at(randi() % remainingPuzzles.size())
	nextPuzzle = remainingPuzzles[(randi() % remainingPuzzles.size())]
	new_puzzle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("ui_cancel")):
		get_tree().quit()
	if Input.is_action_just_pressed("complete_puzzle"):
		_on_next_puzzle()
		

func new_puzzle():
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
		$Background/MarginContainer/PuzzleCounter.text = str(completedPuzzles)
	else:
		get_tree().change_scene_to_file("res://Other Scenes/win_screen.tscn")


func _on_background_game_over():
	for n in get_children():
		remove_child(n)
		n.queue_free()
		
	var gameOverInstance = gameOverScene.instantiate()
	
	add_child(gameOverInstance)
	gameOverInstance.get_node("GameOver/Score").text = "Final Score: " + str(completedPuzzles)
