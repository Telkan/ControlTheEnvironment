extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var hidden = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ShowHide_pressed():
	if hidden:
		set_offset(Vector2(0,0))
		hidden = false
	else:
		set_offset(Vector2(450,0))
		hidden = true
	pass # Replace with function body.
