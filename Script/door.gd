extends StaticBody2D

@onready var left_animated: AnimatedSprite2D = $LeftAnimated
@onready var right_animated: AnimatedSprite2D = $RightAnimated

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body: Node2D) -> void:
	left_animated.play("open_door")
	right_animated.play("open_door")


@warning_ignore("unused_parameter")
func _on_area_2d_body_exited(body: Node2D) -> void:
	left_animated.play("close_door")
	right_animated.play("close_door")
