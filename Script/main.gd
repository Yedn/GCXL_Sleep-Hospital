extends Node
class_name Main

@onready var shop: Control = $Shop
@onready var item: ItemTile = $Tilemap/Item
@onready var button_container: ButtonContainer = $ButtonContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	update_room_value()
	$Suanli.text = "算力："+str(Data.suanli)+"P"


func update():
	item.update()
	shop.update()

func update_room_value():
	for i in Data.room_list:
		var room:Room = Data.room_list[i]
		for j in 5:
			room.value[j] = 0
			room.npc_max = 0
		for id in room.bed_list:
			if room.bed_list[id]!=null:
				room.npc_max += 1
		for id in room.bed_list:
			for j in 5:
				if room.bed_list[id]!=null:
					room.value[j] += room.bed_list[id].value[j]
		for id in room.decoration_list:
			for j in 5:
				if room.decoration_list[id]!=null:
					room.value[j] += room.decoration_list[id].value[j]
		for id in room.facility_list:
			for j in 5:
				if room.facility_list[id]!=null:
					room.value[j] += room.facility_list[id].value[j]
