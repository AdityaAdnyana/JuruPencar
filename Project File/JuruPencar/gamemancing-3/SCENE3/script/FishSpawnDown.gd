extends AnimatedSprite2D

var fish_sample_scene = preload("res://SCENE3/scene/FishObstacleSample.tscn")
var tempo = 1

func _ready() -> void:
	FishingEvent.fish_obstacle_spawn_down.connect(spawn_obstacle_down)
	MusicEvent.new_music_played.connect(get_tempo)
	
func get_tempo(music_name, tempo):
	tempo = tempo

func spawn_obstacle_down() -> void:
	var tween = create_tween()
	var fish_instance = fish_sample_scene.instantiate()
	fish_instance.position = position
	tween.tween_property(fish_instance, "position:x", -55, tempo)
	get_parent().add_child(fish_instance)
	play("spawn") 
	
	 #.from(200)
	
	await get_tree().create_timer(0.2).timeout
	play("default")
