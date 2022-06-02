extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



var gravCenter
var velocity : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity = linear_velocity
	applied_force = SpacePhysics.calculate_gravity_from_position(get_global_position(), gravCenter)
