extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var planetMass 
var gravCenter
var velocity : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	scale = planetMass * Vector2.ONE

func _physics_process(delta):
	if gravCenter == null:
		gravCenter = get_tree().get_nodes_in_group("DefaultWell")[0]
	velocity = linear_velocity
	applied_force = SpacePhysics.calculate_gravity_from_position(get_global_position(), gravCenter)
