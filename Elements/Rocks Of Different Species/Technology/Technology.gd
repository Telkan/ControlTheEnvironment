extends GravityElement


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	technology = 10*planetMass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	people = 0
	food = 0
	bio = 0
	metal = 0
	water = 0