extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const TestProbe = preload("res://Elements/UI/TestProbe/TestProbe.tscn")
const Planet = preload("res://Elements/Planet/Planet.tscn")

onready var chosenWell := $Sun

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
	newProbe.position = chosenWell.position + Vector2(distance,0)
	newProbe.gravCenter = chosenWell
	newProbe.linear_velocity = chosenWell.velocity + Vector2(0,-speed)
	add_child(newProbe)


func _on_CreationBoard_createPlanet(mass, distance, speed):
	var newPlanet = Planet.instance()
	newPlanet.position = chosenWell.position + Vector2(distance,0)
	newPlanet.gravCenter = chosenWell
	newPlanet.linear_velocity = chosenWell.velocity + Vector2(0,-speed)
	add_child(newPlanet)


func _on_CreationBoard_nextWell():
	var listOfWells = get_tree().get_nodes_in_group("GravityWell")
	var currentWellPos = listOfWells.find(chosenWell)
	if currentWellPos == -1:
		chosenWell = $Sun
		return
	if currentWellPos == listOfWells.size() -1:
		chosenWell = listOfWells[0]
		return
	chosenWell = listOfWells[currentWellPos+1]


func _on_CreationBoard_previousWell():
	var listOfWells = get_tree().get_nodes_in_group("GravityWell")
	var currentWellPos = listOfWells.find(chosenWell)
	if currentWellPos == -1:
		chosenWell = $Sun
		return
	if currentWellPos == 0:
		chosenWell = listOfWells[-1]
		return
	chosenWell = listOfWells[currentWellPos-1]
