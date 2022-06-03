extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var moveSpeed = 50
export var zoomSpeed = 10
var velocity = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_parent().find_node("Follow").pressed:
		position = get_parent().chosenWell.get_global_position()
	else:
		velocity = Vector2(get_parent().find_node("Horizontal").value,get_parent().find_node("Vertical").value)
		position+=velocity
	
	
	zoom = get_parent().find_node("Zoom").value * Vector2(1,1)
	pass
