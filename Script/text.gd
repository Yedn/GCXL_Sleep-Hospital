extends Control
class_name Text

@export var text:String
@onready var label: Label = $Label
@onready var tile: TileMapLayer = $TileMapLayer3

var startpos:float
var endpos:Vector2 = Vector2(0,0)
var endpos_y:float = 0

var right:bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = text
	if right == true:
		generate_text_right()
		startpos = (clampi(int(text_length(text)/16),2,14)+1)*16+16
		endpos = Vector2(0,endpos_y)
	else:
		generate_text_left()
		startpos = -180#(clampi(int(text_length(text)/16),2,14)+1)*(-16)-16
		endpos = Vector2(-144+clampi(int(text_length(text)/16),2,14)*16,endpos_y)
	position.x = startpos

func is_chinese_char(c:String):
	if c.length()>0:
		var code_point = c.unicode_at(0)
		return code_point >= 0x4E00 && code_point <= 0x9FFF
	else:
		return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position.lerp(Vector2(endpos),delta*3)

func text_length(_text:String) -> int:
	var length:int = 4
	for i in text.length():
		if(is_chinese_char(_text[i])):
			length += 12
		else:
			length += 8
	return length

func generate_text_right():
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	label.position = Vector2(-148,2)
	for i in clampi(int(text_length(text)/16),2,14)+1:
		var pos:Vector2i = Vector2i(-(i+1),0)
		if i==0:
			tile.set_cell(pos,1,Vector2i(2,0))
		elif i==clampi(int(text_length(text)/16),2,14):
			tile.set_cell(pos,1,Vector2i(0,0))
		else:
			tile.set_cell(pos,1,Vector2i(1,0))

func generate_text_left():
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	label.position = Vector2(-148+16*(9-clampi(int(text_length(text)/16),2,14)),2)
	for i in clampi(int(text_length(text)/16),2,14)+1:
		var pos:Vector2i = Vector2i(-(i+1),0)
		if i==0:
			tile.set_cell(pos,2,Vector2i(2,0))
		elif i==clampi(int(text_length(text)/16),2,14):
			tile.set_cell(pos,2,Vector2i(0,0))
		else:
			tile.set_cell(pos,2,Vector2i(1,0))
