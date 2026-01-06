extends TextureProgressBar

func _ready() -> void:
	self.max_value = ExperienceManager.max_value
	self.value = ExperienceManager.value
	
	$Level.text =  "Lv. " + str(ExperienceManager.level)
