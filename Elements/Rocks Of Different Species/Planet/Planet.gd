extends GravityElement


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var technoGrowingCoeff = 0.000005
export var peopleGrowingCoeff = 1.0005
export var bioGrowingCoeff = 1.0005

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func increaseTech(delta):
	technology+= people * technoGrowingCoeff * delta
	
func increasePeople(delta):
	if food>1 and people<1:
		people = 1
	people += people * peopleGrowingCoeff * delta
	if people>food:
		people=food
		
func increaseFood(delta):
	food = (water*bio*delta) / 100
	pass
	
func increaseBio(delta):
	bio += bio* bioGrowingCoeff * delta
	if bio>water:
		bio=water
	pass

func _process(delta):
	increaseTech(delta)
	increasePeople(delta)
	increaseFood(delta)
	increaseBio(delta)

	pass
