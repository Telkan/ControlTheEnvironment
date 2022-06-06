extends Node2D

const Rocket = preload("res://Elements/Rocketship/Rocketship.tscn")

export var originPath : NodePath
onready var origin = get_node(originPath)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func sendRocket():
	var listOfPotentialPlanets = get_tree().get_nodes_in_group("GravityWell")
	listOfPotentialPlanets.erase(get_tree().get_nodes_in_group("DefaultWell")[0])
	listOfPotentialPlanets.erase(origin)
	var listOfDestinations = []
	for planet in listOfPotentialPlanets:
		if planet.water>10 or planet.metal>10:
			listOfDestinations.append(planet)
	
	if listOfDestinations.size() ==0:
		return
	
	listOfDestinations.shuffle()
	var destination = listOfDestinations[0]
	if origin.metal<10:
		return
	
	var ressourceCost = RessourceTransfer.new()
	ressourceCost.addRessource(SpacePhysics.RESSOURCE_TYPE.METAL,-10)
	ressourceCost.addRessource(SpacePhysics.RESSOURCE_TYPE.PEOPLE,-1)
	origin.absorbRessources(ressourceCost)
	
	var newRocket = Rocket.instance()
	newRocket.set_global_position(get_global_position())
	newRocket.planetToExplore = destination
	newRocket.originPlanet = origin
	newRocket.cargoSpace = 1 *origin.technology
	add_child(newRocket)
	
func _process(_delta):
	if origin.technology >10:
		if $Timer.is_stopped():
			$Timer.start()
		pass


func _on_Timer_timeout():
	sendRocket()
	pass # Replace with function body.
