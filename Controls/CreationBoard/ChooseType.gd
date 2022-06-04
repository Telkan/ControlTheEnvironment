extends VSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var planetType

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if value==0:
		planetType = SpacePhysics.PLANET_TYPE.PLANET
		$Earth.set_visible(true)
		$Ice.set_visible(false)
		$Metal.set_visible(false)
		$Bio.set_visible(false)
		$Technology.set_visible(false)
	elif value==1:
		planetType = SpacePhysics.PLANET_TYPE.ICE
		$Earth.set_visible(false)
		$Ice.set_visible(true)
		$Metal.set_visible(false)
		$Bio.set_visible(false)
		$Technology.set_visible(false)
	elif value==2:
		planetType = SpacePhysics.PLANET_TYPE.METAL
		$Earth.set_visible(false)
		$Ice.set_visible(false)
		$Metal.set_visible(true)
		$Bio.set_visible(false)
		$Technology.set_visible(false)
	elif value==3:
		planetType = SpacePhysics.PLANET_TYPE.BIO
		$Earth.set_visible(false)
		$Ice.set_visible(false)
		$Metal.set_visible(false)
		$Bio.set_visible(true)
		$Technology.set_visible(false)
	elif value==4:
		planetType = SpacePhysics.PLANET_TYPE.TECHNOLOGY
		$Earth.set_visible(false)
		$Ice.set_visible(false)
		$Metal.set_visible(false)
		$Bio.set_visible(false)
		$Technology.set_visible(true)
	pass # Replace with function body.




