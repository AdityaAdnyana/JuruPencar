extends Node2D

@onready var MusicLatar = $MusicLatarScene3
@onready var collision_spawn_timer = $CollisionSpawnTimer
var screen_size

func _ready() -> void:
	MusicEvent.new_music_played.connect(initial_obstacle)
	
	$"../TransitionScreen/AnimationPlayer".play("fade_to_normal")
	set_process(true)
	await  $"../CanvasLayer/Timer".timeout
	$"../CanvasLayer/Timer/Label".hide()
	
	identify_fish("bass_fish")
	screen_size = get_viewport().size
	print(screen_size)

func _process(delta: float) -> void:
	$"../CanvasLayer/Timer/Label".text = str(int($"../CanvasLayer/Timer".time_left))

func identify_fish(fish_name : String):
	if fish_name == "bass_fish":
		MusicEvent.set_music.emit("MeongMeong", "res://SCENE3/asset/music/MeongMeong.mp3", 124.0)

func initial_obstacle(music: String, spawn_time: float):
	collision_spawn_timer.wait_time = spawn_time
	collision_spawn_timer.autostart = true
	collision_spawn_timer.start()

func _on_collision_spawn_timer_timeout() -> void:
	var random_position = randi() % 2
	var obstacle_position
	if random_position == 0:
		obstacle_position = " Bottom"
		FishingEvent.fish_obstacle_spawn_down.emit()
	else:
		obstacle_position = " Up"
		FishingEvent.fish_obstacle_spawn_up.emit()
	
	#print("Load Obstacle", obstacle_position)
	$Tick.play()
