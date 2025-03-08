extends RichTextLabel
class_name InformationText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
"""
text = "患者主述：
学习[color=green]压力大[/color]，整天整夜[color=green]睡不着[/color]

关键词：
[color=green]压力大[/color]，[color=green]睡不着[/color]

初步诊断：
[color=yellow]失眠症[/color]

患者需求:
装饰-[color=yellow]高[/color]      舒适-[color=yellow]高[/color]      解压-[color=yellow]高[/color]  
医疗-[color=49baff]中[/color]    管控-[color=00cf83]低[/color]"
"""

#var tween:Tween
# Called every frame. 'delta' is the elapsed time since the previous frame.
var percent:float = 0
var now_text:String
func _process(delta: float) -> void:
	if $"..".visible == false:
		percent = 0.0
	if Data.line.is_empty() == false:
		var base_text:String = generate_text(Data.line[0].id)
		if now_text != base_text:
			percent = 0.0
			now_text = base_text
		text = base_text.left(int(percent*base_text.length()))
		if percent <= 1.0:
			percent += delta*0.5
		else:
			percent = 1.0
	else:
		text = "[color=gray][i][font_size=12](等待患者中...)[/font_size][/i][/color]"

#func display_text():
#	tween = get_tree().create_tween()
#	text = ""

var word_arr:Array = ["装饰","舒适","解压","医疗","管控"]
func generate_text(id:int) -> String:
	var arr:Array = TextData.text[id][5]
	var zhushu:String = arr[0]
	var keyword_arr:Array = arr[1]
	var keyword:String
	var bing:String = NpcData.jibing_fullname[NpcData.type(id)]
	var xuqiu_arr:Array = NpcData.data[id][1]
	var need:String = ""
	for i in 5: 
		var num:int = xuqiu_arr[i]
		if num >= 5:
			need += word_arr[i]+"-[color=yellow]高[/color]"
		elif num >= 3:
			need += word_arr[i]+"-[color=49baff]中[/color]"
		else:
			need += word_arr[i]+"-[color=00cf83]低[/color]"
		if i != 2:
			need += "    "
		else:
			need += "\n"
	var target_text:String = ""
	if TextData.unlock_dic[NpcData.type(id)] == true:
		for word in keyword_arr:
			zhushu = zhushu.replace(word,"[color=green]%s[/color]"%word)
			keyword += "[color=green]%s[/color]，"%word
		keyword = keyword.left(-1)
		target_text = "患者主述：\n%s\n\n关键词：\n%s\n\n初步诊断：\n[color=yellow]%s[/color]\n\n患者需求:\n%s"%[zhushu,keyword,bing,need]
	else:
		target_text = "患者主述：\n%s\n\n关键词：\n%s\n\n初步诊断：\n[color=white]%s[/color]\n\n患者需求:\n%s"%[zhushu,"[color=gray][i][font_size=12](数据缺失)[/font_size][/i][/color]","[color=gray][i][font_size=12](数据缺失)[/font_size][/i][/color]","[color=gray][i][font_size=12](数据缺失)[/font_size][/i][/color]"]
	return target_text
