extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const TestProbe = preload("res://Elements/UI/TestProbe/TestProbe.tscn")
const Planet = preload("res://Elements/Planet/Planet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$DisplayShot.position = $Sun.position + Vector2($CreationBoard.distance, 0)
	get_tree().call_group("Probe","setPredLength",$CreationBoard.previewSteps)
	pass


func _on_CreationBoard_launchProbe(mass, distance, speed):
	#Create probe
	get_tree().call_group("Probe","queue_free")
	var newProbe = TestProbe.instance()
	newProbe.name = "TestProbe"
	newProbe.position = $Sun.position + Vector2(distance,0)
	newProbe.gravCenter = $Sun
	add_child(newProbe)
	newProbe.linear_velocity = Vector2(0,-speed)
	pass # Replace with function body.


func _on_CreationBoard_createPlanet(mass, distance, speed):
	var newPlanet = Planet.instance()
	#newPlanet.name = "TestProbe"
	newPlanet.position = $Sun.position + Vector2(distance,0)
	newPlanet.gravCenter = $Sun
	add_child(newPlanet)
	newPlanet.linear_velocity = Vector2(0,-speed)
	pass # Replace with function body.
