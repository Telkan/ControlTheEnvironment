extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	stream = load("res://Ressources/Sounds/BootSequence.mp3")
	playing = true
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AudioStreamPlayer_finished():
	playing = false
	queue_free()
	pass # Replace with function body.
