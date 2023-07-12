@tool
extends Node3D

@export var snap:bool:
	set(value):
#		position = Vector3(coordinates.x * hex_radius, 0, coordinates.y * hex_radius)
		var grid_a:Vector2 = (coordinates * hex_radius).snapped(Vector2(hex_radius * sqrt(3), hex_radius * 3))
		var grid_b:Vector2 = (coordinates * hex_radius).snapped(Vector2(hex_radius * sqrt(3), hex_radius * 3))

@export var x:int:
	set(value):
		x = value
		coordinates.x = x
		
@export var y:int:
	set(value):
		y = value
		coordinates.y = y

var coordinates:Vector2i:
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

@export_category("Snap settings")
@export var hex_radius:float:
	set(value):
		hex_radius = value
		coordinates = coordinates
