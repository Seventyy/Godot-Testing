@tool
extends Node3D

@export var coordinates:Vector2i:
	set(value):
		coordinates = value 
		position = Vector3(
			8 * sqrt(3) * (coordinates.x + abs((float)(coordinates.y % 2)/2.)),
			0, 
			12 * coordinates.y 
			)

@export var tile_rotation:int:
	set(value):
		tile_rotation = wrapi(value, 0, 6)
		rotation.y = wrapf(-tile_rotation * TAU/6, 0, TAU)
