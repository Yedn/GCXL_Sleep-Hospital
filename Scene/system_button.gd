extends Button
class_name SystemButton



func _on_pressed() -> void:
	var id:int = get_parent().name.to_int()
	if UpgradeData.upgrade[id] == false and Data.suanli >= 9:
		Data.suanli -= 9
		text = "已解锁"
		UpgradeData.upgrade[id] = true
