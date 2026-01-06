extends GridContainer

@onready var bass_fish_label = $BassFish/Label
@onready var clown_fish_label = $ClownFish/Label
@onready var dory_fish_label = $DoryFish/Label
@onready var salmon_fish_label = $SalmonFish/Label
@onready var cat_fish_label = $CatFish/Label

var current_bass_quantity

func _ready() -> void:
	var all_fish_type = Global.fish_quantity_data.keys()
	
	for fish_type in all_fish_type:
		update_inventory(fish_type)
	
func update_inventory(fish_type: String):
	print("Jumlah: %d" % Global.fish_quantity_data.get(fish_type, 0))
	
	var current_label
	match fish_type:
		"bass_fish":
			current_label = bass_fish_label
		"clown_fish":
			current_label = clown_fish_label
		"dory_fish":
			current_label = dory_fish_label
		"salmon_fish":
			current_label = salmon_fish_label
		"cat_fish":
			current_label = cat_fish_label
	current_label.text = "x" + str(Global.fish_quantity_data[fish_type])
