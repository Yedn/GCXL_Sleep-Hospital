extends Control
class_name WindowUI

@onready var table: Control = $Table
@onready var patient:Patient = table.get_node("Patient")
@onready var book: Control = $Book
@onready var information: Control = $Information

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	$BookButton.visible = UpgradeData.upgrade[1]


func _on_npc_accepted() -> void:
	patient.phase = 2
	#patient.text_container.phase = 1
	#patient.text_container.next_phase()


func _on_npc_rejected() -> void:
	patient.phase = 2
	


func _on_book_button_pressed() -> void:
	information.visible = book.visible
	book.visible = !book.visible
