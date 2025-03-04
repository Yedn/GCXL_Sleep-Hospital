extends Control
class_name RemarkSlot

@export var id:int
@export var pay:int
@export var remark:int

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var rich_text_label: RichTextLabel = $RichTextLabel
@onready var rich_text_label_2: RichTextLabel = $RichTextLabel2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var jibing_name:String = NpcData.jibing_name[NpcData.type(id)]
	match remark:
		2:rich_text_label.text = jibing_name+"\n评价:极好"
		1:rich_text_label.text = jibing_name+"\n评价:好"
		0:rich_text_label.text = jibing_name+"\n评价:差"
	rich_text_label_2.text = "+%dG"%pay
	animated_sprite_2d.sprite_frames = load("res://Animation/"+str(id)+".tres")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
