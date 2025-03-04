extends TileMapLayer

@onready var room: TileMapLayer = $"../Room"
@onready var item: ItemTile = $"../Item"

func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
	if item.get_cell_source_id(coords) == -1:
		return false
	else:
		return true

func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	tile_data.set_navigation_polygon(0,null)
