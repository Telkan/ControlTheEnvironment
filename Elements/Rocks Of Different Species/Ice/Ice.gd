extends GravityElement


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var growingCoeff = 1.0
var minDistanceToGrow = SpacePhysics.minDistanceForIce
export var massToIceCoefficient = 1000


# Called when the node enters the scene tree for the first time.
func _ready():
	water = 10*planetMass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	people = 0
	food = 0
	bio = 0
	metal = 0
	technology = 0
	var sunPosition = get_tree().get_nodes_in_group("DefaultWell")[0].get_global_position()
	var distanceToSun = get_global_position().distance_to(sunPosition)
	if distanceToSun > minDistanceToGrow:
		water+= (distanceToSun - minDistanceToGrow) * growingCoeff * delta
		if water > planetMass*massToIceCoefficient:
			water = planetMass*massToIceCoefficient
	
func getRessourceTransfer():
	var ressource = RessourceTransfer.new()
	ressource.fillRessourceTransfer(water,0,0,0,0,-planetMass*100,0)
	return ressource
