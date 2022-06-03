extends GravityElement


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var people = 0
var ice = 0
var wood = 0
var biosphere = 0
var metals =0
var technology = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	$CollisionShape2D.set_scale(Vector2.ONE *planetMass)
