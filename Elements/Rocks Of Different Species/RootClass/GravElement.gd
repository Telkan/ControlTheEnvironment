class_name GravityElement
extends RigidBody2D


var planetMass 
var gravCenter
var velocity : Vector2

var people = 0
var water = 0
var food = 0
var bio = 0
var metal = 0
var technology = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if not is_instance_valid(gravCenter):
		gravCenter = get_tree().get_nodes_in_group("DefaultWell")[0]
	velocity = linear_velocity
	applied_force = SpacePhysics.calculate_gravity_from_position(get_global_position(), gravCenter)


func absorbRessources(incomingRessources:RessourceTransfer):
	for i in range(len(incomingRessources.values)):
		match incomingRessources.elements[i]:
			SpacePhysics.RESSOURCE_TYPE.BIO:
				bio+=incomingRessources.value[i]
			SpacePhysics.RESSOURCE_TYPE.FOOD:
				food+=incomingRessources.value[i]
			SpacePhysics.RESSOURCE_TYPE.METAL:
				metal+=incomingRessources.value[i]
			SpacePhysics.RESSOURCE_TYPE.PEOPLE:
				people+=incomingRessources.value[i]
			SpacePhysics.RESSOURCE_TYPE.TECHNOLOGY:
				technology+=incomingRessources.value[i]
			SpacePhysics.RESSOURCE_TYPE.WATER:
				water+=incomingRessources.value[i]
	pass
