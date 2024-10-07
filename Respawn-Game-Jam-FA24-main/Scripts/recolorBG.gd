extends Node2D

var BGtype
var BGcolor
var hexCode
@export var countdownTime : int
var strike1 = false
var strike2 = false
var strike3 = false
signal return_to_title

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    randomize()
    _setBackground()
    print(BGcolor)
    print("BGtype is " + BGtype)
    print("hexCode is " + hexCode)
    update_countdown()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    if Input.is_action_just_pressed("add_strike"):
        add_strike()

func _setBackground() -> void:
    # Change Background Color
    var colorFinal = [0.0, 0.0, 0.0]
    var tempString = [0.0, 0.0, 0.0]
    var valid = true
    
    for n in range(3):
        while true:
            colorFinal[n] = float(randi() % 95 + 159)
            valid = true
            
            for x in range(n):
                if abs(colorFinal[x] - colorFinal[n]) < 10.0:
                    valid = false
                    break
            
            if valid:
                break
        
        tempString[n] = String.num_int64(colorFinal[n], 16, true)
        
    $ColorBG.modulate = Color((colorFinal[0] + 1) / 256, (colorFinal[1] + 1) / 256, (colorFinal[2] + 1) / 256, 1)
    $HexCode.modulate = Color((colorFinal[0] + 1) / 256, (colorFinal[1] + 1) / 256, (colorFinal[2] + 1) / 256, 1)
    $PuzzleCounter.modulate = Color((colorFinal[0] + 1) / 256, (colorFinal[1] + 1) / 256, (colorFinal[2] + 1) / 256, 1)
    $Countdown.modulate = Color((colorFinal[0] + 1) / 256, (colorFinal[1] + 1) / 256, (colorFinal[2] + 1) / 256, 1)
    $Strike1.modulate = Color((colorFinal[0] + 1) / 256, (colorFinal[1] + 1) / 256, (colorFinal[2] + 1) / 256, 1)
    $Strike2.modulate = Color((colorFinal[0] + 1) / 256, (colorFinal[1] + 1) / 256, (colorFinal[2] + 1) / 256, 1)
    $Strike3.modulate = Color((colorFinal[0] + 1) / 256, (colorFinal[1] + 1) / 256, (colorFinal[2] + 1) / 256, 1)
    BGcolor = colorFinal
    $HexCode.text = "#" + tempString[0] + tempString[1] + tempString[2]
    hexCode = tempString[0] + tempString[1] + tempString[2]
    
    match (randi() % 3 + 1):
        1:
            $ColorBG.texture = load("res://Assets/Backgrounds/BGsquares.png")
            BGtype = "Squares"
        2:
            $ColorBG.texture = load("res://Assets/Backgrounds/BGcircles.png")
            BGtype = "Circles"
        3:
            $ColorBG.texture = load("res://Assets/Backgrounds/BGtriangles.png")
            BGtype = "Triangles"

func add_strike():
    if strike1 == false:
        strike1 = true
        $Strike1.modulate = Color("CRIMSON")
        $Strike_Sound.play()
    elif strike2 == false:
        strike2 = true
        $Strike2.modulate = Color("CRIMSON")
        $Strike_Sound.play()
    elif strike3 == false:
        strike3 = true
        $Strike3.modulate = Color("CRIMSON")
        $Strike_Sound.play()
        await get_tree().create_timer(.75).timeout
        game_over()

func update_countdown():
    var countdownMins = "%02d" % (countdownTime / 60)
    var countdownSecs = "%02d" % (countdownTime % 60)
    var fullCountdown = countdownMins + ":" + countdownSecs
    $Countdown.text = fullCountdown
    
func game_over():
    get_tree().change_scene_to_file("res://Other Scenes/game_over.tscn")

func _on_timer_timeout():
    countdownTime -= 1
    update_countdown()
    if countdownTime == 0:
        game_over()
