extends Node

@export var move_speed = 200.0


@export var fish_quantity_data: Dictionary[String, int] = {
	"bass_fish": 0,
	"clown_fish": 0,
	"dory_fish": 0,
	"cat_fish": 0,
	"salmon_fish": 0,
}

func add_fish_collection(fish_type):
	if fish_quantity_data.has(fish_type):
		fish_quantity_data[fish_type] += 1
	else:
		push_error("Ikan tidak ditemukan dalam dictionary(fish_quantity_data)" + fish_type)
