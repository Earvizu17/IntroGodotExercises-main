extends Node

const BUS = "Music"

# {track_name: String, track: AudioStream}
var _known_tracks: Dictionary = {}

# {track_name: String, player_node: AudioStreamPlayer}
var _loaded_tracks: Dictionary = {}

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS


func is_track_known(track_name: String) -> bool:
	return _known_tracks.has(track_name)


func is_track_loaded(track_name: String) -> bool:
	return _loaded_tracks.has(track_name)


func require_track(
		track_name: String,
		track: AudioStream,
		override_existing: bool = false
) -> void:
	if not override_existing and is_track_known(track_name):
		return
	
	_known_tracks[track_name] = track


func load_track(track_name: String) -> void:
	if is_track_loaded(track_name):
		return
	
	if not is_track_known(track_name):
		return
	
	var track_node := AudioStreamPlayer.new()
	track_node.stream = _known_tracks[track_name]
	track_node.bus = BUS
	add_child(track_node)
	_loaded_tracks[track_name] = track_node


func play_track(track_name: String, restart: bool = false) -> void:
	load_track(track_name)
	
	if not _loaded_tracks[track_name].playing or restart:
		_loaded_tracks[track_name].play()
