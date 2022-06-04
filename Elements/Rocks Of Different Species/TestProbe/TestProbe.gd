extends GravityElement


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	planetMass = 1
	pass # Replace with function body.

func setPredLength(newLength):
	$Prediction.predLength = newLength
