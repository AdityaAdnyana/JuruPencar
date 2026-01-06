extends TextureProgressBar

#FISH IMAGE SOURCE
var bass_fish_image = load(AssetData.bass_fish_image)
var clown_fish_image = load(AssetData.clown_fish_image)
var dory_fish_image = load(AssetData.dory_fish_image)
var cat_fish_image = load(AssetData.cat_fish_image)
var salmon_fish_image = load(AssetData.salmon_fish_image)

var current_fish_name

var update_value : float = 2.5
var sprite_pos_x : float
var new_sprite_pos_x : float

func _ready() -> void:
	identify_fish(FishingEvent.current_fish)
	value = 5
	
	sprite_pos_x = value * 1.125
	$Sprite2D.position.x = sprite_pos_x
	FishingEvent.on_click_obstacle.connect(increase_progress_bar)
	FishingEvent.off_click_obstacle.connect(decrease_progress_bar)

func identify_fish(fish_name : String):
	current_fish_name = fish_name
	var fish_image
	
	match fish_name:
		"bass_fish":
			fish_image = bass_fish_image
		"clown_fish":
			fish_image = clown_fish_image
		"dory_fish":
			fish_image = dory_fish_image
		"cat_fish":
			fish_image = cat_fish_image
		"salmon_fish":
			fish_image = salmon_fish_image
			
	$Sprite2D.texture = fish_image

func increase_progress_bar():
	self.value += update_value
	new_sprite_pos_x = sprite_pos_x + update_value * 1.125
	sprite_pos_x = clampf(new_sprite_pos_x, 0.0, 120.0)
	$Sprite2D.position.x = sprite_pos_x
	
	print(value)
	if value >= 100:
		#transition_to_main_scene()
		Global.add_fish_collection(current_fish_name)
		ExperienceManager.tambah_poin()
		get_tree().change_scene_to_file("res://SCENE1/scene/Scene1.tscn")
		
	

func  decrease_progress_bar():
	self.value -= update_value
	new_sprite_pos_x = sprite_pos_x - update_value * 1.125
	sprite_pos_x = clampf(new_sprite_pos_x, 0.0, 120.0)
	$Sprite2D.position.x = sprite_pos_x
	if value <= 0:
		get_tree().change_scene_to_file("res://SCENE1/scene/Scene1.tscn")

#func transition_to_main_scene():
	#var main_scene_resource = load("res://SCENE1/scene/Scene1.tscn")
	#var main_scene_instance = main_scene_resource.instantiate()
	#get_tree().root.add_child(main_scene_instance)
	#
	#FishingEvent.fish_successfully_catched.emit(current_fish_name)
	#get_tree().change_scene_to_file("res://SCENE1/scene/Scene1.tscn")
