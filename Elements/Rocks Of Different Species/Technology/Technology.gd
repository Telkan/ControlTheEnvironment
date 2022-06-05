extends GravityElement


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	technology = planetMass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	people = 0
	food = 0
	bio = 0
	metal = 0
	water = 0

func getRessourceTransfer():
	var ressource = RessourceTransfer.new()
	ressource.fillRessourceTransfer(0,0,0,technology,0,-planetMass*100,0)
	return ressource
