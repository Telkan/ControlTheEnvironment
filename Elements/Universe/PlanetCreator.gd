extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const TestProbe = preload("res://Elements/Rocks Of Different Species/TestProbe/TestProbe.tscn")
const Planet = preload("res://Elements/Rocks Of Different Species/Planet/Planet.tscn")
const Ice = preload("res://Elements/Rocks Of Different Species/Ice/Ice.tscn")
const Metal = preload("res://Elements/Rocks Of Different Species/Metal/Metal.tscn")
const Technology = preload("res://Elements/Rocks Of Different Species/Technology/Technology.tscn")
const Bio = preload("res://Elements/Rocks Of Different Species/Bio/Bio.tscn")



onready var chosenWell := $Sun

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	SpacePhysics.amountOfMoney += 1*_delta
	
	var listOfPossibleWinners = get_tree().get_nodes_in_group("GravityWell")
	
	for currentWell in listOfPossibleWinners:
		if currentWell.technology >= 1000000:
			if SpacePhysics.amountOfMoney < 100000:
				get_tree().change_scene("res://Elements/Endings/GoodEnding.tscn")
			else:
				get_tree().change_scene("res://Elements/Endings/GoodEnding.tscn")
	if not is_instance_valid(chosenWell):
		chosenWell = get_tree().get_nodes_in_group("DefaultWell")[0]
	get_tree().call_group("Probe","setPredLength",$CreationBoard.previewSteps)
	$DisplayShot.distance = $CreationBoard.distance
	if $MovementBoard/DispOnOff.pressed == true:
		$DisplayShot.set_visible(true)
		$SelectedGravWell.set_visible(true)
	else:
		$DisplayShot.set_visible(false)
		$SelectedGravWell.set_visible(false)
	pass



func _on_CreationBoard_launchProbe(distance, speed):
	#Create probe
	get_tree().call_group("Probe","queue_free")
	var newProbe = TestProbe.instance()
	newProbe.name = "TestProbe"
	newProbe.position = chosenWell.position + Vector2(distance,0)
	newProbe.gravCenter = chosenWell
	newProbe.linear_velocity = chosenWell.velocity + Vector2(0,-speed)
	add_child(newProbe)


func _on_CreationBoard_createPlanet(mass, distance, speed, planetType):
	get_tree().call_group("Probe","queue_free")
	var newPlanet
	match planetType:
		SpacePhysics.PLANET_TYPE.PLANET:
			newPlanet = Planet.instance()
			SpacePhysics.amountOfMoney+= 50*mass
		SpacePhysics.PLANET_TYPE.ICE:
			newPlanet = Ice.instance()
			SpacePhysics.amountOfMoney+= 10*mass
		SpacePhysics.PLANET_TYPE.METAL:
			newPlanet = Metal.instance()
			SpacePhysics.amountOfMoney+= 100*mass
		SpacePhysics.PLANET_TYPE.TECHNOLOGY:
			newPlanet = Technology.instance()
			SpacePhysics.amountOfMoney+= 1000*mass
		SpacePhysics.PLANET_TYPE.BIO:
			newPlanet = Bio.instance()
			SpacePhysics.amountOfMoney+= 1000*mass
	newPlanet.position = chosenWell.position + Vector2(distance,0)
	newPlanet.gravCenter = chosenWell
	newPlanet.linear_velocity = chosenWell.velocity + Vector2(0,-speed)
	newPlanet.planetMass = mass
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


func _on_CreationBoard_destroy():
	if chosenWell.name != "Sun":
		chosenWell.queue_free()
		chosenWell = get_tree().get_nodes_in_group("DefaultWell")[0]

