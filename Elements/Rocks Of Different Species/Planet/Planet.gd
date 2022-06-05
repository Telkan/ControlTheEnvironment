extends GravityElement


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var technoGrowingCoeff = 0.05
export var peopleGrowingCoeff = 0.5
export var bioGrowingCoeff = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func increaseTech(delta):
	technology+= people * technoGrowingCoeff * delta
	
func increasePeople(delta):
	if people<0:
		people=0
	if food>1 and people<1:
		people = 1
	if people>=1:
		people += people * peopleGrowingCoeff * delta
	if people>food:
		people=food
		
func increaseFood(delta):
	food = (water*bio*delta) / 10
	pass
	
func increaseBio(delta):
	bio += bio* bioGrowingCoeff * delta
	if bio>water:
		bio=water
	pass

func _process(delta):
	increasePeople(delta)
	increaseBio(delta)
	increaseFood(delta)
	increaseTech(delta)

	pass
