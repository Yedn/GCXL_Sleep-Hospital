extends Control
class_name WindowUI

@onready var table: Control = $Table
@onready var patient:Patient = table.get_node("Patient")
@onready var book: Control = $Book

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_npc_accepted() -> void:
	patient.phase = 2
	#patient.text_container.phase = 1
	#patient.text_container.next_phase()


func _on_npc_rejected() -> void:
	patient.phase = 2
	
