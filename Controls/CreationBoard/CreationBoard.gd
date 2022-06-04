extends CanvasLayer

signal launchProbe(distance, speed)
signal createPlanet(mass, distance, speed)
signal nextWell()
signal previousWell()
signal destroy()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mass = 1
var distance = 400
var speed = 200
var previewSteps = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	mass = $Mass.value
	distance += $Distance.value
	speed += $Speed.value
	previewSteps = $PreviewSteps.value
	pass


func _on_Test_pressed():
	emit_signal("launchProbe",distance,speed)
	


func _on_Launch_pressed():
	emit_signal("createPlanet",mass,distance,speed)


func _on_PreviousWell_pressed():
	emit_signal("previousWell")



func _on_NextWell_pressed():
	emit_signal("nextWell")


func _on_Boom_pressed():
	emit_signal("destroy")
