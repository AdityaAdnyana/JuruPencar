extends TextureRect


@onready var grid_container = $GridContainer

func _on_close_button_pressed() -> void:
	visible = false
