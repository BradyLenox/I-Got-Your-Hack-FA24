extends Node2D

signal next_puzzle
signal add_strike

# Instantiate Grids and Codes
var gridColors = [
    ["YYC","MCM","CMY"],
    ["RYC","MBM","CMR"],
    ["GYC","MBG","CGY"],
    ["CCY","YGY","RRC"],
    ["RRB","MBM","BMR"]
]
var solutions = [
    [["3","0","0"],["0","1","0"],["0","0","2"]],
    [["1","0","3"],["0","0","0"],["0","2","0"]],
    [["0","0","2"],["3","1","0"],["0","0","0"]],
    [["0","0","3"],["1","0","0"],["2","0","0"]],
    [["0","0","0"],["3","1","0"],["0","0","2"]]
]
var codeEntered = ""
var codeFinal = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var gridValue = randi() % 5
    var gridFinal = gridColors[gridValue]
    var gridSolve = solutions[gridValue]
    var buttons = [
        $Con/Button1, $Con/Button2, $Con/Button3,
        $Con/Button4, $Con/Button5, $Con/Button6,
        $Con/Button7, $Con/Button8, $Con/Button9
    ]
    
    for i in range(randi() % 4):
        gridFinal = rotateMatrix(gridFinal)
        gridSolve = rotateMatrix(gridSolve)
    
    gridSolve = gridSolve[0]+gridSolve[1]+gridSolve[2]
    for i in range(3):
        var index = gridSolve.find(str(i + 1), 0)
        codeFinal += str(index + 1)
    
    var tempColor = Color(1.0,1.0,1.0,1.0)
    var tempChar = "W"
    for i in range(3):
        for j in range(3):
            match (gridFinal[i][j]):
                "R":
                    tempColor = Color(1.0,0.0,0.0,1.0)
                "G":
                    tempColor = Color(0.0,1.0,0.0,1.0)
                "B":
                    tempColor = Color(0.0,0.0,1.0,1.0)
                "C":
                    tempColor = Color(0.0,1.0,1.0,1.0)
                "M":
                    tempColor = Color(1.0,0.0,1.0,1.0)
                "Y":
                    tempColor = Color(1.0,1.0,0.0,1.0)
            buttons[i*3+j].get_node("Graphic").get_node("BSFill").modulate = tempColor
            buttons[i*3+j].get_node("Text").text = gridFinal[i][j]
    
    pass # Replace with function body.

func rotateMatrix(matrix : Array) -> Array:
    var answer = []
    var row = matrix.size()
    var col
    if (typeof(matrix[0]) == TYPE_ARRAY):
        col = matrix[0].size()
    else:
        col = matrix[0].length()

    for i in range(col):
        # create temporary array;
        var temp = []
        
        for j in range(row):
            temp.push_back(matrix[j][row-1-i])
        # finally, push temp array to answer array
        answer.push_back(temp)

    return answer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

func buttonPressed(color: String, passID: String) -> void:
    addLetter(passID[6])
    pass # Replace with function body.

func addLetter(letter: String) -> void:
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
