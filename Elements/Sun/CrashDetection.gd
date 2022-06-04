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
	
