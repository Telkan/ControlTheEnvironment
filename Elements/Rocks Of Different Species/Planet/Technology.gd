extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(_delta):
	if get_parent().get_parent().technology > 10 and get_parent().get_parent().people>10 :
		set_visible(true)
	else:
		set_visible(false)
