extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var moveSpeed = 50

export var zoomSpeed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		set_position(get_position() + Vector2(moveSpeed*delta,0))
	if Input.is_action_pressed("ui_left"):
		set_position(get_position() + Vector2(-moveSpeed*delta,0))
	if Input.is_action_pressed("ui_up"):
		set_position(get_position() + Vector2(0,-moveSpeed*delta))
	if Input.is_action_pressed("ui_down"):
		set_position(get_position() + Vector2(0,moveSpeed*delta))
	
	if Input.is_action_pressed("ui_select"):
		zoom+= Vector2(zoomSpeed*delta,zoomSpeed*delta)
	if Input.is_action_pressed("ui_cancel"):
		zoom+= Vector2(-zoomSpeed*delta,-zoomSpeed*delta)
	pass
