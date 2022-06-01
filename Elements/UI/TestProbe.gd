extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



var gravCenter
var step = 0.1
var predLength = 100
const rectifyingConstant = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	linear_velocity = Vector2(100,0)
	pass # Replace with function body.

func setPredLength(newLength):
	predLength = newLength

func calculate_gravity():
	var gravDir = (gravCenter.get_global_position() - get_global_position()).normalized()
	var gravForce = (SpacePhysics.gravity_constant) / (get_global_position().distance_to(gravCenter.get_global_position()) *  (get_global_position().distance_to(gravCenter.get_global_position()))) 
	var gravity = gravDir * gravForce
	applied_force = gravity

func calculate_gravity_from_position(currentPosition):
	var gravDir = (gravCenter.get_global_position() - currentPosition).normalized()
	var gravForce = (SpacePhysics.gravity_constant) / (currentPosition.distance_to(gravCenter.get_global_position()) *  (currentPosition.distance_to(gravCenter.get_global_position()))) 
	var gravity = gravDir * gravForce
	return gravity

func generatePath():
	$Prediction.clear_points()
	var currentPosition = get_global_position()
	var currentVelocity = linear_velocity
	
	for i in range(predLength):
		$Prediction.add_point(currentPosition)
		currentVelocity += calculate_gravity_from_position(currentPosition) * step
		currentPosition += currentVelocity * step
		
func _process(delta):
	generatePath()

func _physics_process(delta):
	#calculate_gravity(get_position(), get_parent().find_node("Sun").get_position(), 50, 5000)

	calculate_gravity()	#set_position(get_position()+velocity)
