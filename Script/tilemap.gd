extends Node2D

@warning_ignore("shadowed_global_identifier")
@onready var floor: TileMapLayer = $Floor
@onready var item: ItemTile = $Item
@onready var room: TileMapLayer = $Room


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
