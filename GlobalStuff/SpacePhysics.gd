extends Node

enum RESSOURCE_TYPE {WATER,BIO,METAL,TECHNOLOGY,FOOD,PEOPLE,PLANETMASS}
var gravity_constant = 1000000


func calculate_gravity_from_position(currentPosition, gravCenter):
	var gravDir = (gravCenter.get_global_position() - currentPosition).normalized()
	var gravForce = (SpacePhysics.gravity_constant * gravCenter.planetMass) / (currentPosition.distance_to(gravCenter.get_global_position()) *  (currentPosition.distance_to(gravCenter.get_global_position()))) 
	var gravity = gravDir * gravForce
	return gravity + gravCenter.applied_force

