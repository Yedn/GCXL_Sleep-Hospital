extends Control
class_name Shop

@onready var room_ui: RoomUI = $RoomUI
@onready var shop_ui: ShopUI = $ShopUI
@onready var npc: NPCContainer = $"../NPC"

@onready var label: Label = $"../Label"

var open:bool = false

var startpos:float = -32
var endpos:float = 420
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_label()
	if open == true and (1<=Data.choosed_id and Data.choosed_id<=7):
		position.y = lerpf(position.y,startpos,10*delta)
	else:
		position.y = lerpf(position.y,endpos,10*delta)

func update():
	room_ui.update()
	shop_ui.update()

func update_label():
	var room:Room = get_room()
	if Data.line.size()>0 and room != null:
		var target_id:int = npc.choose_bed_false(room,Data.line[0])
		var value:Array = Data.line[0].compute_room_value(room,target_id)
		label.text = "%d号房 %d床\n装饰:%d 舒适:%d 解压:%d\n医疗:%d 管控:%d 人数:%d/%d"%[Data.choosed_id,target_id+1,value[0],value[1],value[2],value[3],value[4],room.npc_list.size(),room.npc_max]
	elif room!=null:
		label.text = "%d号房(总)\n装饰:%d 舒适:%d 解压:%d\n医疗:%d 管控:%d 人数:%d/%d"%[Data.choosed_id,room.value[0],room.value[1],room.value[2],room.value[3],room.value[4],room.npc_list.size(),room.npc_max]
	else:
		label.text = ""

func get_room() -> Room:
	var id:int = Data.choosed_id
	if 1<=id and id<=7:
		return Data.room_list[id-1]
	else:
		return null



func _on_next_pressed() -> void:
	open = !open
	if open == true:
		$"../Next/TileMapLayer2".visible = true
		$"../Next/TileMapLayer".visible = false
	else:
		$"../Next/TileMapLayer2".visible = false
		$"../Next/TileMapLayer".visible = true
