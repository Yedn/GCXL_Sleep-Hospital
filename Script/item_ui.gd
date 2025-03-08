extends Control
class_name ItemUI

@onready var item_tile: TileMapLayer = $Item
@onready var name_label: RichTextLabel = $Name
@onready var label: RichTextLabel = $Label

@export var item:Item
@export var now_item:Item
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if item != now_item:
		if item != null:
			load_empty()
			load_item()
			$"../UpgradeUI".visible = false
		else:
			load_empty()


func load_item():
	if item != null:
		now_item = item
		var source_size:Vector2i = item.source_size
		var delta_pos:Vector2i = item.delta_pos
		var local_pos:Vector2i = Vector2i(1,2)
		if item.scene_id != -1:
			item_tile.position = Vector2(64,32)
			item_tile.set_cell(local_pos,7,Vector2i(0,0),item.scene_id)
			if item.type == 2:
				item_tile.position = Vector2(56,24)
		elif item.pattern_id == -1:
			item_tile.position = Vector2(56,32)
			for x in source_size.x:
				for y in source_size.y:
					var cell:Vector2i = Vector2i(x,y)+delta_pos+local_pos
					var source_pos:Vector2i = item.source_pos+delta_pos+Vector2i(x,y) 
					item_tile.set_cell(cell,0,source_pos,0)
		else:
			item_tile.position = Vector2(64,32)
			item_tile.set_pattern(local_pos+delta_pos,item_tile.tile_set.get_pattern(item.pattern_id))
		name_label.text = "\n[center]%s[center]"%item.item_name
		var item_value:Array = item.value
		label.text = item.description+"\n\n装饰：%d     舒适：%d\n解压：%d     医疗：%d\n管控：%d"%[item_value[0],item_value[1],item_value[2],item_value[3],item_value[4]]

func load_empty():
	now_item = item
	var source_size:Vector2i = Vector2i(2,3)
	var delta_pos:Vector2i = Vector2i(0,-1)
	var local_pos:Vector2i = Vector2i(1,2)
	for x in source_size.x:
		for y in source_size.y:
			var cell:Vector2i = Vector2i(x,y)+delta_pos+local_pos
			item_tile.set_cell(cell)
	name_label.text = "\n[center]空[center]"
	label.text = ""
	$"../UpgradeUI".visible = true
