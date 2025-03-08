extends Sprite2D
class_name Shadow

@onready var shadow_container: Node2D = $".."
@onready var label: Label = $Label
@onready var npc_container: NPCContainer = $"../../NPC"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shader.set_shader_parameter("red_color",Color8(255,83,66,107))
	shader.set_shader_parameter("gray_color",Color8(0,0,0,107))

# Called every frame. 'delta' is the elapsed time since the previous frame.
var shader:ShaderMaterial = material
func _process(delta: float) -> void:
	if Data.guide_open == true:
		shader.set_shader_parameter("percent",lerpf(shader.get_shader_parameter("percent"),1.0,10*delta))
		label.self_modulate.a = lerpf(shader.get_shader_parameter("percent"),1.0,10*delta)
	else:
		shader.set_shader_parameter("percent",lerpf(shader.get_shader_parameter("percent"),0.0,10*delta))
		label.self_modulate.a = lerpf(shader.get_shader_parameter("percent"),0.0,5*delta)
	var room:Room = Data.room_list[name.to_int()-1]
	if room.digitisation == false:
		shader.set_shader_parameter("state",0)
		label.text = "未数字化"
	elif Data.line.size()>0 and room.npc_list.size()<room.npc_max:
		var npc:NPC = Data.line[0]
		var target_id:int = npc_container.choose_bed_false(room,npc)
		var value:Array = npc.compute_room_value(room,target_id)
		var point:int = compute(value,npc)
		var percent:float = point*100/npc.demand[1]
		label.text = "预期满意度\n%.0f"%percent+"%"
		if TextData.unlock_dic[NpcData.type(npc.id)] == false:
			shader.set_shader_parameter("state",0)
			label.text = "数据缺失"
		elif percent >= 100:
			shader.set_shader_parameter("state",1)
		elif percent >= 50:
			shader.set_shader_parameter("state",2)
		else:
			shader.set_shader_parameter("state",3)
	elif room.npc_list.size()==room.npc_max:
		shader.set_shader_parameter("state",0)
		label.text = "房间已满"
	else:
		shader.set_shader_parameter("state",0)
		label.text = "等待患者"

func compute(value:Array,npc:NPC) -> int:
	var point:int = 0
	for i in 5:
		point += npc.trans[i]*value[i]
	return point
