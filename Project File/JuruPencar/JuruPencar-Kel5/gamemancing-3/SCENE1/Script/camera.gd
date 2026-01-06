extends Camera2D

var perahu
var speed
var isCameraMoving

func _ready() -> void:
	perahu = $"../Perahu"
	isCameraMoving = false
	set_process(false)
	speed = Global.move_speed
	GameEvent.is_player_moving.connect(start_camera_movement)
	

func start_camera_movement(isMoving: bool):
	if isMoving:
		if !isCameraMoving:
			isCameraMoving = true
			await get_tree().create_timer(0.5).timeout
			set_process(true)
		
	

func _process(delta: float) -> void:
	#self.position.x = perahu.position.x
	
	var selfPosX = int(self.position.x)
	var perahuPosX = int(perahu.position.x)
	
	if selfPosX < perahuPosX:
		self.position.x += speed * delta
	elif selfPosX > perahuPosX:
		self.position.x -= speed * delta
	else:
		isCameraMoving = false
		set_process(false)
	print(self.position)
