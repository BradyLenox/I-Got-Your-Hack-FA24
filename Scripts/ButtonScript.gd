extends Node2D

signal button_pushed(value)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func buttonPressed() -> void:
	button_pushed.emit($Text.text, self.get_name())
	pass # Replace with function body.

func buttonUp() -> void:
	$Graphic/BSOutline.texture = load("res://Assets/UI Panels/Buttons/ButtonU.png")
	$Graphic/BSFill.texture = load("res://Assets/UI Panels/Buttons/ButtonUF.png")
	$Text.position.y -= 18
	pass # Replace with function body.

func buttonDown() -> void:
	$Graphic/BSOutline.texture = load("res://Assets/UI Panels/Buttons/ButtonD.png")
	$Graphic/BSFill.texture = load("res://Assets/UI Panels/Buttons/ButtonDF.png")
	$Text.position.y += 18
	pass # Replace with function body.
