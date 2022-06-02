extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var gravCenter

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func setPredLength(newLength):
	$Prediction.predLength = newLength

#func _process(delta):
#	pass

func _physics_process(delta):
	applied_force = SpacePhysics.calculate_gravity_from_position(get_global_position(), gravCenter)
