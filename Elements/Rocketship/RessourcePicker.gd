extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal gatheredRessources(gains)
signal WeAreHome()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#return the ressource transfer to send to the victim
func stealTheShitOutOfThatPlanet(planet):
	
	var stealingRessource = RessourceTransfer.new()
	var gains = RessourceTransfer.new()
	
	if planet.water > get_parent().cargoSpace:
		stealingRessource.addRessource(SpacePhysics.RESSOURCE_TYPE.WATER, -get_parent().cargoSpace)
		gains.addRessource(SpacePhysics.RESSOURCE_TYPE.WATER, get_parent().cargoSpace)
	else:
		stealingRessource.addRessource(SpacePhysics.RESSOURCE_TYPE.WATER, -planet.water)
		gains.addRessource(SpacePhysics.RESSOURCE_TYPE.WATER, planet.water)
			
	if planet.metal > get_parent().cargoSpace:
		stealingRessource.addRessource(SpacePhysics.RESSOURCE_TYPE.METAL, -get_parent().cargoSpace)
		gains.addRessource(SpacePhysics.RESSOURCE_TYPE.METAL, get_parent().cargoSpace)
	else:
		stealingRessource.addRessource(SpacePhysics.RESSOURCE_TYPE.METAL, -planet.metal)
		gains.addRessource(SpacePhysics.RESSOURCE_TYPE.METAL, planet.metal)
		
	emit_signal("gatheredRessources",gains)
	return stealingRessource


func _on_RessourcePicker_area_entered(area):
	if get_parent().goHome == false:
		if area.get_planet() == get_parent().planetToExplore:
			var stolenRessources = stealTheShitOutOfThatPlanet(area.get_planet())
			area.get_planet().absorbRessources(stolenRessources)
	else:
		if area.get_planet() == get_parent().originPlanet:
			emit_signal("WeAreHome")
	pass # Replace with function body.
