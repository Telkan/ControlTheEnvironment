extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2(5,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func calculate_gravity(satellite_pos, planet_pos, satellite_mass, planet_mass, delta):

	var gravDir = (planet_pos - satellite_pos).normalized()

	var gravForce = (SpacePhysics.gravity_constant * satellite_mass * planet_mass) / (satellite_pos.distance_to(planet_pos) *                    (satellite_pos.distance_to(planet_pos))) 
	

	var gravity = gravDir * gravForce
	

	applied_force = gravity


func _physics_process(delta):
	calculate_gravity(get_position(), get_parent().find_node("Sun").get_position(), 50, 500,delta)
	#set_position(get_position()+velocity)
	#set_position(get_position()+velocity)
