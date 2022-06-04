extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_parent_properties():
	var element = "Rock"
	var value = 10
	return [element, value]
	

func _on_CollisionDetector_area_entered(area):
	
	pass # Replace with function body.
