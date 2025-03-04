extends Control
class_name Config

@onready var main:Main = get_node("/root/Main")
@onready var menu:Menu = main.get_node("Menu")
@onready var npc:NPCContainer = get_node("/root/Main/NPC")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update():
	for i in 9:
		var temp:bool = false
		#for file in DirAccess.get_files_at("C:/Users/Administrator/AppData/Roaming/Godot/app_userdata/test17/"):
			#if file == "save_%d.tres"%i:
				#temp = true
		$GridContainer.get_node("Load"+str(i)).visible = temp

func _on_save_pressed() -> void:
	Data._save()


func _on_load_0_pressed() -> void:
	Data._load(0)
	main.update()
	menu.visible = false


func _on_load_1_pressed() -> void:
	Data._load(1)
	main.update()
	menu.visible = false


func _on_load_2_pressed() -> void:
	Data._load(2)
	main.update()
	menu.visible = false

func _on_load_3_pressed() -> void:
	Data._load(3)
	main.update()
	menu.visible = false

func _on_load_4_pressed() -> void:
	Data._load(4)
	main.update()
	menu.visible = false

func _on_load_5_pressed() -> void:
	Data._load(5)
	main.update()
	menu.visible = false

func _on_load_6_pressed() -> void:
	Data._load(6)
	main.update()
	menu.visible = false

func _on_load_7_pressed() -> void:
	Data._load(7)
	main.update()
	menu.visible = false

func _on_load_8_pressed() -> void:
	Data._load(8)
	main.update()
	menu.visible = false
