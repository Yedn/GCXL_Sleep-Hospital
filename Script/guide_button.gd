extends Button
class_name BuideButton

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var tile_map_layer_2: TileMapLayer = $TileMapLayer2
@onready var shadow_container: Node2D = get_node("/root/Main/ShadowContainer")

var open:bool = false

func _process(delta: float) -> void:
	visible = UpgradeData.upgrade[3]

func _on_pressed() -> void:
	open = !open
	Data.guide_open = open
	if open == true:
		tile_map_layer_2.visible = true
		tile_map_layer.visible = false
	else:
		tile_map_layer_2.visible = false
		tile_map_layer.visible = true
