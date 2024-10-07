extends Node2D

<<<<<<< Updated upstream
var clicked : bool = false
var itemsClicked = [];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    clicked = false
    itemsClicked = [];
    for child in get_children():
        if ("clickedOn" in child):
            if (child.clickedOn == true):
                clicked = true
                itemsClicked.append(child)
    for i in range(itemsClicked.size()):
        if (i == 0):
            continue
        else:
            print('lol')
        itemsClicked[i].clickedOn = false
    pass
=======
signal next_puzzle
signal add_strike

var clicked : bool = false
var itemsClicked = [];
var solved = false

var symbolArray = [
	"𐴎", "ℸ", "ꬾ", "🞷",
	"🖻", "𞤕", "𞡜", "𞡠",
	"𞋏", "𝚯", "𝕕", "𝇠",
	"𖹣", "𖡨", "𓄿", "𑈩"
]
var colors = [
	[Color(1.0,0.0,1.0,1.0),"M"],
	[Color(1.0,0.5,0.0,1.0),"O"],
	[Color(0.0,1.0,0.0,1.0),"L"],
	[Color(1.0,0.0,0.0,1.0),"R"],
	[Color(0.0,1.0,1.0,1.0),"C"],
	[Color(1.0,1.0,1.0,1.0),"W"],
	[Color(0.0,0.0,1.0,1.0),"B"],
	[Color(0.0,0.5,0.0,1.0),"G"],
	[Color(1.0,1.0,0.0,1.0),"Y"],
	[Color(0.75,0.0,1.0,1.0),"P"]
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Instantiating
	var symbolNums = []
	var colorBoxes = [
		[get_node("Con/ColorSquare/Color1"),get_node("Con/Wire1"),get_node("Con/ColorSquare/ColorLabel1")],
		[get_node("Con/ColorSquare/Color2"),get_node("Con/Wire2"),get_node("Con/ColorSquare/ColorLabel2")],
		[get_node("Con/ColorSquare/Color3"),get_node("Con/Wire3"),get_node("Con/ColorSquare/ColorLabel3")],
		[get_node("Con/ColorSquare/Color4"),get_node("Con/Wire4"),get_node("Con/ColorSquare/ColorLabel4")]
	]
	var symbolLabels = [
		get_node("Con/LabelSquare/Label1"),
		get_node("Con/LabelSquare/Label2"),
		get_node("Con/LabelSquare/Label3"),
		get_node("Con/LabelSquare/Label4")
	]
	var points = [
		Vector2(420,66),
		Vector2(420,162),
		Vector2(420,258),
		Vector2(420,354),
	]
	
	# Assigning Symbols
	for n in range(4):
		while true:
			var newNum = randi() % symbolArray.size()
			var valid = true
			
			for x in symbolNums:
				if (newNum == x):
					valid = false
					break
			
			if valid:
				symbolNums.append(newNum)
				symbolLabels[n].text = symbolArray[newNum]
				break
	print(symbolNums)
	var symbolNumsSorted = symbolNums.duplicate()
	for n in range(4):
		symbolNumsSorted[n] = [symbolNumsSorted[n], n]
	symbolNumsSorted.sort()
	print(symbolNumsSorted)
	
	# Assigning Colors
	var colorNums = []
	for n in range(4):
		while true:
			var newNum = randi() % colors.size()
			var valid = true
			
			for x in colorNums:
				if (newNum == x):
					valid = false
					break
			
			if valid:
				colorNums.append(newNum)
				colorBoxes[n][0].color = colors[newNum][0]
				colorBoxes[n][1].default_color = colors[newNum][0]
				colorBoxes[n][2].text = colors[newNum][1]
				break
	print(colorNums)
	var colorNumsSorted = colorNums.duplicate()
	for n in range(4):
		colorNumsSorted[n] = [colorNumsSorted[n], n]
	colorNumsSorted.sort()
	print(colorNumsSorted)
	
	# Assigning Solutions to Wires
	for i in range(4):
		colorBoxes[colorNumsSorted[i][1]][1].solutionPoint = points[symbolNumsSorted[i][1]]
	for i in range(4):
		for j in range(4):
			if (colorBoxes[i][1].solutionPoint != points[j]):
				print(points[j])
				colorBoxes[i][1].touchPoints.push_back(points[j])
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	clicked = false
	itemsClicked = [];
	for child in $Con.get_children():
		if ("clickedOn" in child):
			if (child.clickedOn == true):
				clicked = true
				itemsClicked.append(child)
	for i in range(itemsClicked.size()):
		if (i == 0):
			continue
		itemsClicked[i].clickedOn = false
	var connectedWires = 0
	for child in $Con.get_children():
		if ("solutionFound" in child):
			if (child.solutionFound == true):
				connectedWires += 1
	if (connectedWires == 4 && solved == false):
		solved = true
		next_puzzle.emit()
		print("SUCCESS")
	pass


func _on_wire_1_strike() -> void:
	add_strike.emit()
	pass # Replace with function body.
>>>>>>> Stashed changes
