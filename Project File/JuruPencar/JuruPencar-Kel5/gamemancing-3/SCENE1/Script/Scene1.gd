extends Node2D

var able_to_hide_tutorial: bool = false
@onready var cast_sound = $CastSound
func _ready() -> void:
	$TransitionScreen/AnimationPlayer.play("fade_to_normal")
	$Perahu/Player.play("hook")
	await get_tree().create_timer(1.3).timeout
	$Perahu/Player.play("idle")
	able_to_hide_tutorial = true
	$TransitionScreen.hide()

func _input(event: InputEvent) -> void:
	if able_to_hide_tutorial:
		$Tutorial.hide()
	if Input.is_action_just_pressed("space"):
		if cast_sound.stream != null:
			cast_sound.play()
		
		$Perahu/Player.play("fish")
		await get_tree().create_timer(2.0).timeout
		start_fishing()

func start_fishing():
	get_tree().change_scene_to_file("res://SCENE2/scene_2.tscn")
	
#
#func on_fish_caught(fish_name):
	#print("Dapat ikan: ", fish_name)
	#get_tree().paused = false
