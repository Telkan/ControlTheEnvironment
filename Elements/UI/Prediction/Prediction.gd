extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var predLength = 10
var step = .1
# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	pass # Replace with function body.

func generatePath():
	clear_points()
	var currentPosition = get_parent().get_global_position()
	var currentVelocity = get_parent().linear_velocity
	
	for i in range(predLength):
		add_point(currentPosition)
		currentVelocity += SpacePhysics.calculate_gravity_from_position(currentPosition, get_parent().gravCenter) * step
		currentPosition += currentVelocity * step
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_instance_valid(get_parent().gravCenter):
		generatePath()
