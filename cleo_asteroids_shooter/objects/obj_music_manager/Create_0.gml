game_songs = [
mus_death_galaxy,
mus_splitting_bullets,
mus_last_stand
]

global.music_volume = 0 //0.5

game_songs_length = array_length(game_songs) - 1

var _choose_song = irandom_range(0,game_songs_length)
song_instance = array_get(game_songs,_choose_song)
audio_play_sound(song_instance,1,0,1)
audio_sound_gain(song_instance,0,0)
audio_sound_gain(song_instance,global.music_volume,5000)