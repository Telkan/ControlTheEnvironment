extends ProgressBar


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var controled := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if controled and Input.is_action_pressed("mouseClick"):
		var mousePosY = get_viewport().get_mouse_position()[1]
		mousePosY = -(mousePosY - rect_position[1])
		if mousePosY > 0 and mousePosY < rect_size[0]:
			value = (mousePosY * max_value)/rect_size[0]
	pass


func _on_MassDisplay_mouse_entered():
	controled = true


func _on_MassDisplay_mouse_exited():
	controled = false
	pass # Replace with function body.
