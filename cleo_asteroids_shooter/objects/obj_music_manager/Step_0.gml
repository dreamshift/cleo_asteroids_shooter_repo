if not audio_is_playing(song_instance)
{
	var _choose_song = irandom_range(0,game_songs_length)
	song_instance = array_get(game_songs,_choose_song)
	audio_play_sound(song_instance,1,0,1)
	audio_sound_gain(song_instance,0,0)
	audio_sound_gain(song_instance,global.music_volume,5000)
}