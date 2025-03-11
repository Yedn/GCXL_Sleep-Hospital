extends Node


var data_read:Dictionary = {}

var question_path:String = "res://CSV/出题.csv"


func read_question(file_path: String) -> Dictionary:
	var dic:Dictionary = {}
	var file_open = FileAccess.open(file_path, FileAccess.READ)
	var tempList = file_open.get_csv_line(",")
	var keysCount:int = 1
	while (tempList.size() > 1):
		dic[keysCount] = tempList
		tempList = file_open.get_csv_line(",")
		keysCount += 1
	return dic

func Read_CSV(file_path: String) -> Dictionary:
	var file_open= FileAccess.open(file_path, FileAccess.READ)
	#每个用","隔开，内部个list的元素用";"隔开
	var tempList = file_open.get_csv_line(",")
	var keysCount : int=1
	var data_list :Dictionary = {}
	while (tempList.size() >= 1):
		var temp_ReadUnit = tempList[0].split(";")
		var _SingleList = []
		for j in temp_ReadUnit.size():
			var tempUnit:Array = []
			for i in temp_ReadUnit.size():
				tempUnit.append(temp_ReadUnit[i].to_int)
			_SingleList.append(tempUnit)
		data_list[keysCount] = _SingleList
		tempList = file_open.get_csv_line(",")
		keysCount += 1
	return data_list


#调用Get_Data,传入路径来获得data 
#这里叫data是因为在原项目那个dictionary就叫data
func Get_Data(file_path: String) -> Dictionary:
	data_read = Read_CSV(file_path)
	return data_read


func get_item():
	var f = FileAccess.open("res://CSV/item.csv",FileAccess.WRITE_READ)
	for file in DirAccess.get_files_at("res://Item/bed/"):
		var item_file:String = "res://Item/bed/"+file
		var item:Item = load(item_file) as Item
		var arr:Array = [item.type,file.left(-5).to_int(),item.item_name,item.description,item.price,item.value[0],item.value[1],item.value[2],item.value[3],item.value[4],item.scene_id]
		f.store_csv_line(PackedStringArray(arr))
	for file in DirAccess.get_files_at("res://Item/decoration/"):
		var item_file:String = "res://Item/decoration/"+file
		var item:Item = load(item_file) as Item
		var arr:Array = [item.type,file.left(-5).to_int(),item.item_name,item.description,item.price,item.value[0],item.value[1],item.value[2],item.value[3],item.value[4],item.scene_id]
		f.store_csv_line(PackedStringArray(arr))
	for file in DirAccess.get_files_at("res://Item/facility/"):
		var item_file:String = "res://Item/facility/"+file
		var item:Item = load(item_file) as Item
		var arr:Array = [item.type,file.left(-5).to_int(),item.item_name,item.description,item.price,item.value[0],item.value[1],item.value[2],item.value[3],item.value[4],item.scene_id]
		f.store_csv_line(PackedStringArray(arr))

func read_item():
	var file_open = FileAccess.open("res://CSV/item.csv", FileAccess.READ)
	var tempList = file_open.get_csv_line(",")
	while (tempList.size() > 1):
		var item:Item = Item.new()
		item.type = tempList[0].to_int()
		item.id = tempList[1].to_int()
		item.item_name = tempList[2]
		item.description = tempList[3]
		item.price = tempList[4].to_int()
		item.value = [tempList[5].to_int(),tempList[6].to_int(),tempList[7].to_int(),tempList[8].to_int(),tempList[9].to_int()]
		item.scene_id = tempList[10].to_int()
		match item.type:
			0:ResourceSaver.save(item,"res://Item/bed/%d.tres"%item.id)
			1:ResourceSaver.save(item,"res://Item//decoration/%d.tres"%item.id)
			2:ResourceSaver.save(item,"res://Item/facility/%d.tres"%item.id)
		tempList = file_open.get_csv_line(",")

func _ready():
	pass
