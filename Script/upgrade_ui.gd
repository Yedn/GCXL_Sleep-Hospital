extends Control
class_name UpgradeUI

@onready var digital: Control = $Digital

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	digital.visible = UpgradeData.upgrade[2]
	$Name2.visible = !UpgradeData.upgrade[2]
