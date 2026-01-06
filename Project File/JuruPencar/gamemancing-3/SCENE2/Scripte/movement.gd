extends CharacterBody2D


@export var GRAVITY : int = 60

@export var SPEED :float = 500

var lv : float = 5

func _physics_process(delta: float) -> void:
	#print(self.name)
		
	var directon = Input.get_axis("ui_left","ui_right")
	#movement
	if directon:
		velocity.x =directon * SPEED
	else:
		velocity.x=0
		
		
	#rotate
	if directon ==1:
		$AnimatedSprite2D.flip_h = false
	if directon==-1:
		$AnimatedSprite2D.flip_h=true
	
	
	#gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta
	
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("fish"):
		pass
		#get_tree().change_scene_to_file()
	if area.is_in_group("barrier"):
		if lv >= 4:
			GRAVITY = 0
			velocity.y = 0
		
