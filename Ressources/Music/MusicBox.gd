extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()

var listOfMusic = ["res://Ressources/Music/Blue Night.mp3","res://Ressources/Music/Comet.mp3","res://Ressources/Music/Galactic Journey.mp3","res://Ressources/Music/In the Shadows.mp3","res://Ressources/Music/Lost Signal.mp3","res://Ressources/Music/Skylights (Efence Remix).mp3","res://Ressources/Music/Spaceflight.mp3","res://Ressources/Music/Stellardrone - Comet Halley [Light Years].mp3","res://Ressources/Music/The Quiet Earth.mp3","res://Ressources/Music/Volt's Theme.mp3"]

var currentMusic
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize() 
	currentMusic = 0
	rng.randomize()
	listOfMusic.shuffle()
	stream = load(listOfMusic[currentMusic])
	playing = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	volume_db = get_tree().get_nodes_in_group("SoundLevel")[0].value
	if volume_db <= -19:
		volume_db = -100
	pass

func _on_AudioStreamPlayer_finished():
	currentMusic+=1
	if currentMusic >= listOfMusic.size()-1:
		currentMusic = 0
		listOfMusic.shuffle()
		
	stream = load(listOfMusic[currentMusic])
	playing = true
	pass # Replace with function body.
