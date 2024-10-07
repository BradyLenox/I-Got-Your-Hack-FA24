extends Node2D

signal next_puzzle
signal add_strike

var codes = ["NPKZC", "MSPPZ", "QNKZP", "MNKTY", "QPKNC", "QPYCP",
"BKGPZ", "CJPYQ", "VPPZC", "JVKTI", "MVKIP", "CQPKG", "NKGPC", "MNPPZ", "CQPPZ",
"QNKTY", "JPYQC", "CPYCP", "KTIPZ", "ZPKVC", "QFPPZ", "NPPZC", "CQKGP", "BKGPC"]

var solutions = ["73237", "25333", "87233", "27246", "77562", "83673", "32533",
"72368", "53337", "25246", "25263", "78325", "72537", "27333", "78333", "87246",
"23687", "73673", "24633", "33257", "89333", "73337", "78253", "32537"]

var code_num
var current_code
var current_solution
var code_iterator
var solution_iterator = 0
var completedPuzzles

# Called when the node enters the scene tree for the first time.
func _ready():
    randomize()
    code_iterator = randi_range(0,4)
    code_num = randi() % codes.size()
    current_code = codes[code_num]
    if completedPuzzles % 2 == 0:
        current_solution = solutions[code_num]
    else:
        current_solution = solutions[code_num].reverse()
    print(current_code)
    print(current_solution)
    
    $Code.text = current_code[code_iterator]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func correct_button():
    #print("correct")
    pass
    
func incorrect_button():
    #print("incorrect")
    solution_iterator = 0
    add_strike.emit()
    
func win():
    #print("win")
    next_puzzle.emit()
    
func _on_timer_timeout():
    if code_iterator < 4:
        code_iterator += 1
    else:
        code_iterator = 0
    $Code.text = current_code[code_iterator]


func _on_button_1_button_pushed():
    if current_solution[solution_iterator] == "1" && solution_iterator < 4:
        correct_button()
        solution_iterator += 1
    elif current_solution[solution_iterator] == "1" && solution_iterator == 4:
        win()
    else: 
        incorrect_button()
        
func _on_button_2_button_pushed():
    if current_solution[solution_iterator] == "2" && solution_iterator < 4:
        correct_button()
        solution_iterator += 1
    elif current_solution[solution_iterator] == "2" && solution_iterator == 4:
        win()
    else: 
        incorrect_button()


func _on_button_3_button_pushed():
    if current_solution[solution_iterator] == "3" && solution_iterator < 4:
        correct_button()
        solution_iterator += 1
    elif current_solution[solution_iterator] == "3" && solution_iterator == 4:
        win()
    else: 
        incorrect_button()


func _on_button_4_button_pushed():
    if current_solution[solution_iterator] == "4" && solution_iterator < 4:
        correct_button()
        solution_iterator += 1
    elif current_solution[solution_iterator] == "4" && solution_iterator == 4:
        win()
    else: 
        incorrect_button()


func _on_button_5_button_pushed():
    if current_solution[solution_iterator] == "5" && solution_iterator < 4:
        correct_button()
        solution_iterator += 1
    elif current_solution[solution_iterator] == "5" && solution_iterator == 4:
        win()
    else: 
        incorrect_button()


func _on_button_6_button_pushed():
    if current_solution[solution_iterator] == "6" && solution_iterator < 4:
        correct_button()
        solution_iterator += 1
    elif current_solution[solution_iterator] == "6" && solution_iterator == 4:
        win()
    else: 
        incorrect_button()


func _on_button_7_button_pushed():
    if current_solution[solution_iterator] == "7" && solution_iterator < 4:
        correct_button()
        solution_iterator += 1
    elif current_solution[solution_iterator] == "7" && solution_iterator == 4:
        win()
    else: 
        incorrect_button()


func _on_button_8_button_pushed():
    if current_solution[solution_iterator] == "8" && solution_iterator < 4:
        correct_button()
        solution_iterator += 1
    elif current_solution[solution_iterator] == "8" && solution_iterator == 4:
        win()
    else: 
        incorrect_button()


func _on_button_9_button_pushed():
    if current_solution[solution_iterator] == "9" && solution_iterator < 4:
        correct_button()
        solution_iterator += 1
    elif current_solution[solution_iterator] == "9" && solution_iterator == 4:
        win()
    else: 
        incorrect_button()
