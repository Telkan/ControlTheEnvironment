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
func _process(delta):
	velocity = Vector2(get_parent().find_node("Wheel").value,get_parent().find_node("Wheel2").value)
	position+=velocity
	if Input.is_action_pressed("ui_select"):
		zoom+= Vector2(zoomSpeed*delta,zoomSpeed*delta)
	if Input.is_action_pressed("ui_cancel"):
		zoom+= Vector2(-zoomSpeed*delta,-zoomSpeed*delta)
	pass
