class_name GravityElement
extends RigidBody2D


var planetMass 
var gravCenter
var velocity : Vector2


var people = 1
var water = 2
var food = 3
var bio = 4
var metal = 5
var technology = 6



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
				bio+=incomingRessources.values[i]
			SpacePhysics.RESSOURCE_TYPE.FOOD:
				food+=incomingRessources.values[i]
			SpacePhysics.RESSOURCE_TYPE.METAL:
				metal+=incomingRessources.values[i]
			SpacePhysics.RESSOURCE_TYPE.PEOPLE:
				people+=incomingRessources.values[i]
			SpacePhysics.RESSOURCE_TYPE.TECHNOLOGY:
				technology+=incomingRessources.values[i]
			SpacePhysics.RESSOURCE_TYPE.WATER:
				water+=incomingRessources.values[i]
			SpacePhysics.RESSOURCE_TYPE.PLANETMASS:
				planetMass+=incomingRessources.values[i]

func getRessourceTransfer():
	var ressource = RessourceTransfer.new()
	ressource.fillRessourceTransfer(water,bio,metal,technology,food,people,planetMass)
	return ressource
