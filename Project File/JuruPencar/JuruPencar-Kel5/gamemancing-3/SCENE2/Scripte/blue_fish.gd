extends CharacterBody2D
@export var test1 : CharacterBody2D
@export var moveSpeed : float = 400
var move_direction: Vector2
var temp_direction: Vector2 = Vector2(0,0)
var wander_time: float


func _process(delta):
	update(delta)
func _physics_process(delta):
	_physics_update(delta)

func randomize_wander():
	move_direction=Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_time=randf_range(1,3)

func Enter():
	randomize_wander()

func update(delta : float):
	if wander_time >0:
		wander_time -= delta
	else:
		randomize_wander()

func _physics_update(delta: float):
	if test1:
		#print("salmon")
		test1.velocity= move_direction* moveSpeed
		if temp_direction < move_direction :
			$AnimatedSprite2D.flip_h = false
		if temp_direction > move_direction:
			$AnimatedSprite2D.flip_h = true
		test1.move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if body.name == "Player":
		FishingEvent.current_fish = "bass_fish"
		get_tree().change_scene_to_file("res://SCENE3/scene/FishingMechanic.tscn")
