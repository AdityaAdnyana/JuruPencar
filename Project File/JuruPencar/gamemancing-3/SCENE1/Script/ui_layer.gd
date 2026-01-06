extends CanvasLayer


@onready var menu_panel = $MenuPanel
@onready var inventory_panel = $InventoryPanel 

@onready var label_level = $HBoxContainer/LabelLevel
@onready var progress_bar = $HBoxContainer/ProgressBar

@onready var sfx_player = $SFXPlayer

var sound_click = preload("res://SCENE1/assets/music/button-click-289742 (2).mp3") 
var sound_close = preload("res://SCENE1/assets/music/click-button-140881.mp3")


func play_sfx(sound_file):
	# Cek apakah node player ada dan file suara tidak kosong
	if sfx_player and sound_file:
		sfx_player.stream = sound_file  # Pasang kasetnya
		sfx_player.play()             # Putar suaranya
		
		

func _ready():
	# Sembunyikan panel saat mulai
	if menu_panel: menu_panel.visible = false
	if inventory_panel: inventory_panel.visible = false

# --- FUNGSI TOMBOL MENU ---

func _on_tombol_close_pressed():
	play_sfx(sound_close)
	if menu_panel: menu_panel.visible = false


func _on_tombolexit_pressed():
	play_sfx(sound_click)
	get_tree().quit()


func _on_menu_button_pressed() -> void:
	play_sfx(sound_click)
	menu_panel.visible = not menu_panel.visible

func _on_collection_button_pressed() -> void:
	play_sfx(sound_click)
	if inventory_panel.visible == false: 
		inventory_panel.visible = true
	else:
		inventory_panel.visible = false




func _on_close_button_pressed() -> void:
		play_sfx(sound_close)
