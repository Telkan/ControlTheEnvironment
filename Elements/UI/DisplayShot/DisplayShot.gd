extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var distance = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	position = get_parent().chosenWell.position + Vector2(distance, 0)
	scale = get_parent().get_node("Camera2D").zoom
