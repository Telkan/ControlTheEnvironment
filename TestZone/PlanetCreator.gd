extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Test_pressed():
	$TestProbe.set_global_position($Sun.get_global_position() + Vector2($Distance.value,0))
	$TestProbe.linear_velocity = Vector2(0,$VerticalSpeed.value) 
	#$TestProbe.planetMass = $Mass.value
	pass # Replace with function body.
