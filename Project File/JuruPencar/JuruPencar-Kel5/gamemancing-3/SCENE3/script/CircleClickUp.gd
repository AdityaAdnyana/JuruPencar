extends AnimatedSprite2D

var is_fish_on_the_click_area : bool
var currentFish

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("z_key"):
		self.play("click")
		if(is_fish_on_the_click_area):
			currentFish.queue_free()
			is_fish_on_the_click_area = false
			FishingEvent.on_click_obstacle.emit()
		else:
			FishingEvent.off_click_obstacle.emit()
		if get_tree() != null:
			await get_tree().create_timer(0.1).timeout
		self.play("default")

func _on_click_detection_atas_area_entered(area: Area2D) -> void:
	currentFish = area
	is_fish_on_the_click_area = true
	

func _on_click_detection_atas_area_exited(area: Area2D) -> void:
	is_fish_on_the_click_area = false
