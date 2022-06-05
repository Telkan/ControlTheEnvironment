extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	set_global_position(get_parent().chosenWell.get_global_position())
	scale = get_parent().get_node("Camera2D").zoom
	
	var planetToDisplay = get_parent().chosenWell
	if planetToDisplay.name == "Sun":
		$displayValues.text = "NAME=SUN\nTEMPERATURE=HOT\nTIME OF DAY=UNKNOWN\nASTROLOGICAL SIGN=LEO"
	else:
		var format_string = "WATER=%s\nFOOD=%s\nBIOSPHERE=%s\nMETALS=%s\nPEOPLE=%s\nTECHNOLOGY=%s"
		var actual_string = format_string % [floor(planetToDisplay.water),floor(planetToDisplay.food),floor(planetToDisplay.bio),floor(planetToDisplay.metal),floor(planetToDisplay.people), floor(planetToDisplay.technology)]
		$displayValues.text = actual_string
