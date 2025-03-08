extends Node


var data_read:Dictionary = {}

var question_path:String = "res://CSV/出题.csv"

func _ready() -> void:
	pass
	#print(read_question(question_path))

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
