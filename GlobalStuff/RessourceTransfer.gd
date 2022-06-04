class_name RessourceTransfer
extends Node


var values = []
var elements = []

func resetResources():
	values = []
	elements = []
	
func addRessource(element, value):
	values.append(value)
	elements.append(element)
	
func fillRessourceTransfer(water,bio,metal,technology,food,people):
	resetResources()
	addRessource(SpacePhysics.RESSOURCE_TYPE.WATER, water)
	addRessource(SpacePhysics.RESSOURCE_TYPE.BIO, bio)	
	addRessource(SpacePhysics.RESSOURCE_TYPE.METAL, metal)
	addRessource(SpacePhysics.RESSOURCE_TYPE.TECHNOLOGY, technology)
	addRessource(SpacePhysics.RESSOURCE_TYPE.FOOD, food)
	addRessource(SpacePhysics.RESSOURCE_TYPE.PEOPLE, people)
