extends Node2D

signal next_puzzle
signal add_strike

var even = ["ACDC", "FDCA", "FDAD", "AFDF"]
var odd = ["AACD", "FDCD", "ACFD", "DCFA"]
var completedPuzzles
var hexCode
var solution
var solution_iterator = 0

# Called when the node enters the scene tree for the first time.
func _ready():
    if completedPuzzles % 2 == 0:
        if hexCode[1].hex_to_int() < 9 and hexCode[3].hex_to_int() < 9:
            print("even low low")
            solution = "ACDC"
        elif hexCode[1].hex_to_int() < 9 and hexCode[3].hex_to_int() > 8:
            print("even low high")
            solution = "FDCA"
        elif hexCode[1].hex_to_int() > 8 and hexCode[3].hex_to_int() < 9:
            print("even high low")
            solution = "DCDD"
        elif hexCode[1].hex_to_int() > 8 and hexCode[3].hex_to_int() > 8:
            print("even high high")
            solution = "DCAA"
    else:
        if hexCode[1].hex_to_int() < 9 and hexCode[3].hex_to_int() < 9:
            print("odd low low")
            solution = "AACD"
        elif hexCode[1].hex_to_int() < 9 and hexCode[3].hex_to_int() > 8:
            print("odd low high")
            solution = "FDCD"
        elif hexCode[1].hex_to_int() > 8 and hexCode[3].hex_to_int() < 9:
            print("odd high low")
            solution = "ACFD"
        elif hexCode[1].hex_to_int() > 8 and hexCode[3].hex_to_int() > 8:
            print("odd high high")
            solution = "DCFA"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass

func win():
    await get_tree().create_timer(.75).timeout
    next_puzzle.emit()

func _on_a_click(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.pressed:
        if solution[solution_iterator] == "A":
            solution_iterator += 1
            $A_Sound.play()
            $PianoHolder/A.visible = false
            await get_tree().create_timer(0.5).timeout
            $PianoHolder/A.visible = true
            if solution_iterator > solution.length() - 1:
                win()
                
        else:
            add_strike.emit()
            $PianoHolder/A.visible = false
            if get_tree() != null:
                await get_tree().create_timer(0.5).timeout
                $PianoHolder/A.visible = true
        

func _on_b_click(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.pressed:
        add_strike.emit()
        $PianoHolder/B.visible = false
        if get_tree() != null:
            await get_tree().create_timer(0.5).timeout
            $PianoHolder/B.visible = true


func _on_c_click(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.pressed:
        if solution[solution_iterator] == "C":
            solution_iterator += 1
            $C_Sound.play()
            $PianoHolder/C.visible = false
            await get_tree().create_timer(0.5).timeout
            $PianoHolder/C.visible = true
            if solution_iterator > solution.length() - 1:
                win()
        else:
            add_strike.emit()
            $PianoHolder/C.visible = false
            if get_tree() != null:
                await get_tree().create_timer(0.5).timeout
                $PianoHolder/C.visible = true
        

func _on_d_click(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.pressed:
        if solution[solution_iterator] == "D":
            solution_iterator += 1
            $D_Sound.play()
            $PianoHolder/D.visible = false
            await get_tree().create_timer(0.5).timeout
            $PianoHolder/D.visible = true
            if solution_iterator > solution.length() - 1:
                win()
        else:
            add_strike.emit()
            $PianoHolder/D.visible = false
            if get_tree() != null:
                await get_tree().create_timer(0.5).timeout
                $PianoHolder/D.visible = true


func _on_e_click(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.pressed:
        add_strike.emit()
        $PianoHolder/E.visible = false
        if get_tree() != null:
            await get_tree().create_timer(0.5).timeout
            $PianoHolder/E.visible = true


func _on_f_click(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.pressed:
        if solution[solution_iterator] == "F":
            solution_iterator += 1
            $F_Sound.play()
            $PianoHolder/F.visible = false
            await get_tree().create_timer(0.5).timeout
            $PianoHolder/F.visible = true
            if solution_iterator > solution.length() - 1:
                win()
        else:
            add_strike.emit()
            $PianoHolder/F.visible = false
            if get_tree() != null:
                await get_tree().create_timer(0.5).timeout
                $PianoHolder/F.visible = true


func _on_g_click(viewport, event, shape_idx):
    if event is InputEventMouseButton and event.pressed:
        add_strike.emit()
        $PianoHolder/G.visible = false
        if get_tree() != null:
            await get_tree().create_timer(0.5).timeout
            $PianoHolder/G.visible = true
