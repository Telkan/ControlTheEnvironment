extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mass = 50
var distance = 100
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mass += $Mass.value
	distance += $Distance.value
	speed += $Speed.value
	pass
