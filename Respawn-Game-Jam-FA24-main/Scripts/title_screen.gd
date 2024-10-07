extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
<<<<<<< Updated upstream
=======
	if (Input.is_action_pressed("ui_cancel")):
		get_tree().quit()
>>>>>>> Stashed changes
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Other Scenes/game_space.tscn")
