extends CanvasLayer


#
var hidden = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ShowHide_pressed():
	if hidden:
		set_offset(Vector2(0,0))
		hidden = false
	else:
		set_offset(Vector2(-386,0))
		hidden = true
	pass # Replace with function body.


func _on_Planet_pressed():
	$Label.set_visible(false)
	$PlaneteLabel.set_visible(true)
	$IceLabel.set_visible(false)
	$BioLabel.set_visible(false)
	$MetalLabel.set_visible(false)
	$TechnoLabel.set_visible(false)
	pass # Replace with function body.


func _on_Ice_pressed():
	$Label.set_visible(false)
	$PlaneteLabel.set_visible(false)
	$IceLabel.set_visible(true)
	$BioLabel.set_visible(false)
	$MetalLabel.set_visible(false)
	$TechnoLabel.set_visible(false)


func _on_Bio_pressed():
	$Label.set_visible(false)
	$PlaneteLabel.set_visible(false)
	$IceLabel.set_visible(false)
	$BioLabel.set_visible(true)
	$MetalLabel.set_visible(false)
	$TechnoLabel.set_visible(false)


func _on_Metal_pressed():
	$Label.set_visible(false)
	$PlaneteLabel.set_visible(false)
	$IceLabel.set_visible(false)
	$BioLabel.set_visible(false)
	$MetalLabel.set_visible(true)
	$TechnoLabel.set_visible(false)


func _on_Technology_pressed():
	$Label.set_visible(false)
	$PlaneteLabel.set_visible(false)
	$IceLabel.set_visible(false)
	$BioLabel.set_visible(false)
	$MetalLabel.set_visible(false)
	$TechnoLabel.set_visible(true)
