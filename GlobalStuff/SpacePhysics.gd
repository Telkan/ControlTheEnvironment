extends Node


var gravity_constant = 1000000


func calculate_gravity_from_position(currentPosition, gravCenter):
	var gravDir = (gravCenter.get_global_position() - currentPosition).normalized()
	var gravForce = (SpacePhysics.gravity_constant) / (currentPosition.distance_to(gravCenter.get_global_position()) *  (currentPosition.distance_to(gravCenter.get_global_position()))) 
	var gravity = gravDir * gravForce
	return gravity

