extends TextureProgressBar
# --- DATA ---
var level = 1
var xp_sekarang = 0      # Ikan yang sudah didapat di level ini
var xp_target = 5        # Target ikan untuk naik level berikutnya

# --- FUNGSI NAMBAH POIN ---
func _ready() -> void:
	self.value = xp_sekarang
	self.max_value = xp_target

func tambah_poin():
	print("Tambah Poin")
	print("EXP Sekarang: ",  xp_sekarang)
	xp_sekarang += 1
	self.value = xp_sekarang
	self.max_value = xp_target
	
	# Cek apakah target tercapai?
	if xp_sekarang >= xp_target:
		naik_level()

func naik_level():
	level += 1
	xp_sekarang = 0      # Reset bar jadi kosong lagi
	xp_target *= 1.2     # Persulit level berikutnya (misal jadi butuh 7 ikan)
	self.value = xp_sekarang
	self.max_value = xp_target
	print("Hore! Naik ke Level S.", level)
