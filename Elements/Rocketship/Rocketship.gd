extends Node2D

var planetToExplore
var originPlanet
var velocity = Vector2()
var goHome = false
var ressourcesGathered = RessourceTransfer.new()
var speed = 100
var acceleration = 10
var cargoSpace

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not goHome:
		if not is_instance_valid(planetToExplore):
			goHome = true
			return
			
		set_rotation((planetToExplore.get_global_position() - get_global_position()).angle())
		velocity = (planetToExplore.get_global_position() - get_global_position()).normalized() *delta * speed
		speed+=acceleration*delta
		global_position+= velocity
	else:
		if not is_instance_valid(originPlanet):
			queue_free()
			return
		set_rotation((originPlanet.get_global_position() - get_global_position()).angle())
		velocity = (originPlanet.get_global_position() - get_global_position()).normalized() *delta * speed
		speed+=acceleration*delta
		global_position+= velocity
	pass


func _on_RessourcePicker_gatheredRessources(gains):
	ressourcesGathered = gains
	goHome = true
	pass # Replace with function body.


func _on_RessourcePicker_WeAreHome():
	originPlanet.absorbRessources(ressourcesGathered)
	queue_free()
	pass # Replace with function body.
