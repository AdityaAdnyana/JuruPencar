extends Area2D
var bass_fish_image = load(AssetData.bass_fish_image)
var clown_fish_image = load(AssetData.clown_fish_image)
var dory_fish_image = load(AssetData.dory_fish_image)
var cat_fish_image = load(AssetData.cat_fish_image)
var salmon_fish_image = load(AssetData.salmon_fish_image)

func _ready() -> void:
	var fish_name = FishingEvent.current_fish
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
