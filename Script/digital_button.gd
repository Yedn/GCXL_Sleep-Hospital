extends Button
class_name DigitalButton

func _process(delta: float) -> void:
	var room:Room = get_room()
	if room:
		if room.digitisation == true:
			$TileMapLayer2.visible = true
			$TileMapLayer.visible = false
			text = "已升级"
		else:
			$TileMapLayer2.visible = false
			$TileMapLayer.visible = true
			text = "数字化升级\n2P算力"

func _on_pressed() -> void:
	if get_room().digitisation == false and Data.suanli>=2:
		Data.suanli -= 2
		get_room().digitisation = true
		$TileMapLayer2.visible = true
		$TileMapLayer.visible = false
		text = "已升级"

func get_room() -> Room:
	var id:int = Data.choosed_id
	if 1<=id and id<=7:
		return Data.room_list[id-1]
	else:
		return null
