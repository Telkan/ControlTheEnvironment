extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var lenght = 50
var point = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	add_point(get_parent().get_global_position())

	if get_point_count()>= lenght:
		remove_point(0)
