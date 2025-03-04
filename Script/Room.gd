extends Node
class_name Room

@export var pos:Vector2i
@export var id:int
@export var type:int

#bed0,decoration2,facility1
@export var bed_num:int
@export var facility_num:int
@export var decoration_num:int

@export var bed_list:Dictionary
@export var bed_pos:Dictionary

@export var facility_list:Dictionary
@export var facility_pos:Dictionary

@export var decoration_list:Dictionary
@export var decoration_pos:Dictionary

@export var value:Array = [0,0,0,0,0]
@export var choosed_slot:Array

@export var npc_max:int
@export var npc_list:Array
