extends Line2D

<<<<<<< Updated upstream
=======
signal add_strike
signal strike

>>>>>>> Stashed changes
var clickedOn : bool = false
var r = 20.0
var solutionPoint : Vector2
var solutionFound : bool = false
var touchPoints = []

var badBool = [false, false]
var badCooldown = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var m_pos = get_local_mouse_position()
	if (clickedOn == false && r >= points[2].distance_to(m_pos) && !get_parent().get_parent().clicked):
		clickedOn = Input.is_action_pressed("mouse_left")
	elif (!Input.is_action_pressed("mouse_left")):
		clickedOn = false
	
	if Input.is_action_pressed("add_strike"):
		print(solutionPoint)
	
	badBool[1] = badBool[0]
	badBool[0] = false
	if (!clickedOn):
		for i in touchPoints:
			if (r >= points[2].distance_to(i)):
				badBool[0] = true
	
	if (!badBool[0] == badBool[1] && badBool[0] == true):
		print("bad")
<<<<<<< Updated upstream
=======
		strike.emit()
>>>>>>> Stashed changes
		badCooldown = 10
	if (badCooldown > 0): --badCooldown
	
	if (clickedOn):
		points[2] = m_pos
		solutionFound = false
	elif (r >= points[2].distance_to(solutionPoint)):
		points[2] = lerp(points[2], solutionPoint, .1)
		solutionFound = true
	else:
		points[2] = lerp(points[2], points[1] + Vector2(25,0), .1)
		solutionFound = false
