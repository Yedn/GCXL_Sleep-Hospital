extends RichTextLabel
class_name MoneyLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "[color=white]金钱:%dG"%Data.money
	$"../Frame".text = "声望:"+str(Data.frame)
