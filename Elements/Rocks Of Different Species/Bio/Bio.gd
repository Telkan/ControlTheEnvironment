extends GravityElement


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	bio = 10*planetMass
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	people = 0
	food = 0
	metal = 0
	technology = 0
	water = 0
