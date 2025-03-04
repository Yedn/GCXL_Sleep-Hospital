extends Resource
class_name Item

@export var item_name:String
@export var description:String
@export var price:int
@export var value:Array = [0,0,0,0,0]
@export var type:int
@export var id:int
@export var source_size:Vector2i
@export var source_pos:Vector2i
@export var delta_pos:Vector2i
@export var level:int
@export var pattern_id:int = -1
@export var scene_id:int = -1
@export var special_pos:Vector2i = Vector2i(9,9)

var occupy:bool = false

func new() -> Item:
	var item = Item.new()
	item.item_name = item_name
	item.price = price
	item.value = value
	item.type = type
	item.id = id
	item.source_size = source_size
	item.source_pos = source_pos
	item.delta_pos = delta_pos
	item.level = level
	item.pattern_id = pattern_id
	item.description = description
	item.scene_id = scene_id
	item.occupy = occupy
	return item
