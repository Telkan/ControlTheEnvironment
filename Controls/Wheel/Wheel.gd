extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var slowDown = 40
export var vertical = false
export var coeffPower = 50

var value = 0
var active = false
var previousPosition = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		if vertical:
			value = (previousPosition[1] - get_viewport().get_mouse_position()[1]) * delta * coeffPower
		else:
			value = (previousPosition[0] - get_viewport().get_mouse_position()[0]) * delta * coeffPower
	elif value != 0:
		if value<0:
			value += slowDown * delta
			if value >0 :
				value = 0
		else:
			value -= slowDown * delta
			if value <0 :
				value = 0
	previousPosition = get_viewport().get_mouse_position()
	print(value)


func _on_Wheel_button_down():
	previousPosition = get_viewport().get_mouse_position()
	value = 0
	active = true
	pass # Replace with function body.


func _on_Wheel_button_up():
	active = false
	pass # Replace with function body.
