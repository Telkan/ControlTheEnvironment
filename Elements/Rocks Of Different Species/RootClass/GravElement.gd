class_name GravityElement
extends RigidBody2D


var planetMass 
var gravCenter
var velocity : Vector2


var people = 0.0
var water = 0.0
var food = 0.0
var bio = 0.0
var metal = 0.0
var technology = 0.0



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	$CollisionShape2D.set_scale(Vector2.ONE *planetMass)

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
				if bio<0:
					bio=0
			SpacePhysics.RESSOURCE_TYPE.FOOD:
				food+=incomingRessources.values[i]
				if food<0:
					food=0
			SpacePhysics.RESSOURCE_TYPE.METAL:
				metal+=incomingRessources.values[i]
				if metal<0:
					metal=0
			SpacePhysics.RESSOURCE_TYPE.PEOPLE:
				people+=incomingRessources.values[i]
				if people<0:
					people=0
			SpacePhysics.RESSOURCE_TYPE.TECHNOLOGY:
				technology+=incomingRessources.values[i]
				if technology<0:
					technology=0
			SpacePhysics.RESSOURCE_TYPE.WATER:
				water+=incomingRessources.values[i]
				if water<0:
					water=0
			SpacePhysics.RESSOURCE_TYPE.PLANETMASS:
				planetMass+=incomingRessources.values[i]
				

func getRessourceTransfer():
	var ressource = RessourceTransfer.new()
	ressource.fillRessourceTransfer(water,bio,metal,technology,food,people,planetMass/10)
	return ressource
