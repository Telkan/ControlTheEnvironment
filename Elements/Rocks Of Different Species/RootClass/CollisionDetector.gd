extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var planetPath : NodePath
onready var planet = get_node(planetPath)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_planet():
	return planet
	

func _on_CollisionDetector_area_entered(area):
	var otherPlanet = area.get_planet()
	
	if otherPlanet.planetMass > planet.planetMass:
		var ressources = planet.getRessourceTransfer()
		otherPlanet.absorbRessources(ressources)
		planet.queue_free()
	
	elif otherPlanet.planetMass == planet.planetMass:
		if planet.name < otherPlanet.name:
			var ressources = planet.getRessourceTransfer()
			otherPlanet.absorbRessources(ressources)
			planet.queue_free()
	
	
	
	if otherPlanet.name == "Sun":
		planet.queue_free()
	pass # Replace with function body.
