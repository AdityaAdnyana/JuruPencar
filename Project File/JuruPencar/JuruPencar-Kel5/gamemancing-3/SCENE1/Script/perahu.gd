extends Sprite2D

# --- PENGATURAN ---
var speed
@onready var player_anim = $Player

# --- VARIABEL POSISI ---
var posisi_berdiri_asli : Vector2
var offset_duduk = Vector2(0, 12) 

# --- BATAS GERAK ---
var batas_atas = 425
var batas_bawah = 600

func _ready():
	speed = Global.move_speed

	posisi_berdiri_asli = player_anim.position

func _process(delta):
	# 1. INPUT
	var gerakan = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if gerakan != Vector2.ZERO:
		
		GameEvent.is_player_moving.emit(true)
		
		# --- GERAKAN ---
		position += gerakan * speed * delta
		
		# --- PEMBATAS (CLAMP) ---
		position.y = clamp(position.y, batas_atas, batas_bawah)
		
		# --- FLIP (HADAP KIRI/KANAN) ---
		if gerakan.x != 0:
			flip_h = (gerakan.x < 0)
			if player_anim:
				player_anim.flip_h = (gerakan.x < 0)

		# --- LOGIKA ROTASI (MIRING) ---
		var target_miring = 0.0
		
		if gerakan.y < 0: # Kalau gerak ke ATAS
			target_miring = -15.0 # Miring ke atas 15 derajat
		elif gerakan.y > 0: # Kalau gerak ke BAWAH
			target_miring = 10.0  # Miring ke bawah 10 derajat
		
		# Koreksi Miring saat Hadap Kiri
		# Kalau perahu hadap kiri, rotasinya harus dibalik supaya moncongnya yang naik
		if flip_h:
			target_miring = -target_miring
			
		# Terapkan rotasi
		# 'lerp' supaya miringnya halus, tidak kaku patah-patah
		rotation_degrees = lerp(rotation_degrees, target_miring, 0.1)

		# --- ANIMASI PLAYER ---
		#if player_anim:
		player_anim.play("row")
		player_anim.position = posisi_berdiri_asli + offset_duduk
			
	else:
		GameEvent.is_player_moving.emit(false)
		
		# --- DIAM ---
		# Kembalikan rotasi jadi lurus (0 derajat) pelan-pelan
		rotation_degrees = lerp(rotation_degrees, 0.0, 0.1)
		
		#if player_anim:
		if player_anim.animation != "fish" && player_anim.animation != "hook": 
			player_anim.play("idle")
			player_anim.position = posisi_berdiri_asli
			
	
