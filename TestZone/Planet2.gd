extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export(NodePath) var gravCenterPath
onready var gravCenter = get_node(gravCenterPath) 

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(100,0)
	pass # Replace with function body.

func calculate_gravity(satellite_pos, planet_pos, satellite_mass, planet_mass):
	var gravDir = (planet_pos - satellite_pos).normalized()
	var gravForce = (SpacePhysics.gravity_constant * satellite_mass * planet_mass) / (satellite_pos.distance_to(planet_pos) *  (satellite_pos.distance_to(planet_pos))) 
	var gravity = gravDir * gravForce
	applied_force = gravity

func calculate_gravity3():
	var gravDir = (gravCenter.get_global_position() - get_global_position()).normalized()
	var gravForce = (SpacePhysics.gravity_constant) / (get_global_position().distance_to(gravCenter.get_global_position()) *  (get_global_position().distance_to(gravCenter.get_global_position()))) 
	var gravity = gravDir * gravForce
	applied_force = gravity


func _physics_process(delta):
	#calculate_gravity(get_position(), get_parent().find_node("Sun").get_position(), 50, 5000)

	calculate_gravity3()	#set_position(get_position()+velocity)
