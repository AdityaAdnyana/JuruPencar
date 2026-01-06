extends AudioStreamPlayer

@export var music_name: String
@export var path: String
@export var bpm: float

var bpm_in_second: float

func _ready() -> void:
	MusicEvent.set_music.connect(music)

func music(music_name: String, path: String, bpm: float):
	self.music_name = music_name
	self.path = path
	if bpm != null:
		self.bpm = bpm
	else:
		self.MUSIC_BPM = 0.0
	play_music()

func play_music():
	var new_stream = load(path)
	if new_stream:
		self.stream = new_stream
		if "bpm" in self.stream: 
			self.stream.bpm = bpm
				
		stream.bpm = bpm
		bpm_in_second = (60/bpm)
		
		MusicEvent.new_music_played.emit(music_name,bpm_in_second)
		play()
	else :
		push_error("MUSIC ERROR: Error ketika memuat music ", path)
