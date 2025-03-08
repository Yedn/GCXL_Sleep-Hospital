extends Button
class_name BoardButton

@onready var button: Button = $Button

@export var id:int = 1
@export var node_arr:Array[Control]

func _process(delta: float) -> void:
	if UpgradeData.upgrade[id] == false:
		button.text = "未解锁"
	else:
		if id == 1:
			button.text = "点击进入"
		else:
			button.text = "已解锁"

func _on_pressed() -> void:
	for i in 3:
		if i != id-1:
			node_arr[i].visible = false
		else:
			node_arr[i].visible = true

func _on_button_pressed() -> void:
	if UpgradeData.upgrade[id] == true and id == 1:
		$"../Match".visible = true
	else:
		_on_pressed()
