extends AnimatedSprite2D


func _on_animation_finished() -> void:
	get_tree().change_scene_to_file("res://SCENE1/scene/Scene1.tscn")
