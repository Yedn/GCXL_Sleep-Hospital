extends Control
class_name ShopSlot

@onready var back_tile: TileMapLayer = $Back
@onready var name_label: Label = $Name
@onready var price_label: Label = $Price
@onready var button: Button = $Button
@onready var item_tile: TileMapLayer = $Item
@onready var main:Main = get_node("/root/Main")

@export var type:int
@warning_ignore("unused_private_class_variable")
@export var _name:String
@export var id:int
@export var item:Item

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_item()
	load_item()
	update()

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	update()

func update():
	var now_price:int= 0
	var room:Room = get_room()
	if room != null:
		if room.choosed_slot.size()>0:
			var slot_id:int = room.choosed_slot[1]
			match type:
				0:
					if slot_id<=1:
						if room.bed_list[slot_id] != null:
							now_price = room.bed_list[slot_id].price
				1:
					if room.facility_list[slot_id] != null:
						now_price = room.facility_list[slot_id].price
				2:
					if room.decoration_list[slot_id] != null:
						now_price = room.decoration_list[slot_id].price
	name_label.text = str(item.item_name)
	price_label.text = str(item.price-now_price)+"G"

func load_item():
	var source_size:Vector2i = item.source_size
	var delta_pos:Vector2i = item.delta_pos
	var local_pos:Vector2i = Vector2i(1,2)
	if item.scene_id != -1:
		item_tile.position = Vector2(8,-8)
		item_tile.set_cell(local_pos,7,Vector2i(0,0),item.scene_id)
		if item.type == 2:
			item_tile.position = Vector2(0,-16)
	elif item.pattern_id == -1:
		item_tile.position = Vector2(0,-8)
		for x in source_size.x:
			for y in source_size.y:
				var cell:Vector2i = Vector2i(x,y)+delta_pos+local_pos
				var source_pos:Vector2i = item.source_pos+delta_pos+Vector2i(x,y) 
				item_tile.set_cell(cell,0,source_pos,0)
	else:
		item_tile.position = Vector2(8,-8)
		item_tile.set_pattern(local_pos+delta_pos,item_tile.tile_set.get_pattern(item.pattern_id))
	var now_price:int= 0
	var room:Room = get_room()
	if room != null:
		if room.choosed_slot.size()>0:
			var slot_id:int = room.choosed_slot[1]
			match type:
				0:
					if room.bed_list[slot_id] != null:
						now_price = room.bed_list[slot_id].price
				1:
					if room.facility_list[slot_id] != null:
						now_price = room.facility_list[slot_id].price
				2:
					if room.decoration_list[slot_id] != null:
						now_price = room.decoration_list[slot_id].price
	name_label.text = str(item.item_name)
	price_label.text = str(item.price-now_price)+"G"

func get_item():
	@warning_ignore("unused_variable")
	var file_path:String
	@warning_ignore("unused_variable")
	var path:String
	match type:
		0:
			item = Data.item_source_dic[0][id]
		1:
			item = Data.item_source_dic[1][id]
		2:
			item = Data.item_source_dic[2][id]

func get_room() -> Room:
	@warning_ignore("shadowed_variable")
	var id:int = Data.choosed_id
	if 1<=id and id<=7:
		return Data.room_list[id-1]
	else:
		return null

func buy_item():
	var room:Room = get_room()
	var slot_id:int = room.choosed_slot[1]
	var now_price:int= 0
	match type:
		0:
			if room.bed_list[slot_id] != null:
				now_price = room.bed_list[slot_id].price
		1:
			if room.facility_list[slot_id] != null:
				now_price = room.facility_list[slot_id].price
		2:
			if room.decoration_list[slot_id] != null:
				now_price = room.decoration_list[slot_id].price
	if room != null and Data.money >= item.price-now_price:
		Data.money -= item.price-now_price
		var occupy:bool = false
		match type:
			0:
				if room.bed_list[slot_id] != null:
					occupy = room.bed_list[slot_id].occupy
			1:
				if room.facility_list[slot_id] != null:
					occupy = room.facility_list[slot_id].occupy
			2:
				if room.decoration_list[slot_id] != null:
					occupy = room.decoration_list[slot_id].occupy
		match type:
			0:
				room.bed_list[slot_id] = item.new()
				room.bed_list[slot_id].occupy = occupy
			1:
				room.facility_list[slot_id] = item.new()
				room.facility_list[slot_id].occupy = occupy
			2:
				room.decoration_list[slot_id] = item.new()
				room.decoration_list[slot_id].occupy = occupy

func _on_button_pressed() -> void:
	pass


func _on_button_button_down() -> void:
	get_item()
	load_item()
	buy_item()
	main.update()
