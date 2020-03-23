import 'package:flute_music_player/flute_music_player.dart';
import 'package:music_player/src/models/album.dart';
import 'package:music_player/src/models/playback.dart';
import 'package:music_player/src/models/playerstate.dart';
import 'package:rxdart/rxdart.dart';

class MusicPlayerBloc {
  BehaviorSubject<List<Song>> _songs$;
  BehaviorSubject<List<Album>> _albums$;
  BehaviorSubject<MapEntry<PlayerState, Song>> _playerState$;
  BehaviorSubject<MapEntry<List<Song>, List<Song>>>
      _playlist$; //key is normal, value is shuffle
  BehaviorSubject<Duration> _position$;
  BehaviorSubject<List<Playback>> _playback$;
  BehaviorSubject<List<Song>> _favorites$;
  BehaviorSubject<bool> _isAudioSeeking$;
  MusicFinder _audioPlayer;
  Song _defaultSong;

  BehaviorSubject<List<Song>> get songs$ => _songs$;
  BehaviorSubject<List<Album>> get albums$ => _albums$;
  BehaviorSubject<MapEntry<PlayerState, Song>> get playerState$ =>
      _playerState$;
  BehaviorSubject<Duration> get position$ => _position$;
  BehaviorSubject<List<Playback>> get playback$ => _playback$;
  BehaviorSubject<List<Song>> get favorites$ => _favorites$;

  MusicPlayerBloc() {
    _initDefultSong();
    _initStreams();
    _initObservers();
    _initAudioPlayer();
  }

  // fetch all songs
  // add songs to List
  Future<void> fetchSongs() async {
    await MusicFinder.allSongs().then((data) {
      _songs$.add(data);
    });
  }

// update state of music player {playing, paused, stopped,}
  void updatePlayerState(PlayerState state, Song song) {
    _playerState$.add(MapEntry(state, song));
  }

  // Play Song
  void playMusic(Song song) {
    _audioPlayer.play(song.uri);
    updatePlayerState(PlayerState.playing, song);
  }

  // pause music
  void pauseMusic(Song song) {
    _audioPlayer.pause();
    updatePlayerState(PlayerState.paused, song);
  }

// stop the music
  void stopMusic() {
    _audioPlayer.stop();
  }

// update position
  void updatePostion(Duration duration) {
    _position$.add(duration);
  }

  // update playlist
  void updatePlaylist(List<Song> normalPlaylist) {
    List<Song> _shufflePlaylist = []..addAll(normalPlaylist);
    _shufflePlaylist.shuffle();
    _playlist$.add(MapEntry(normalPlaylist, _shufflePlaylist));
  }

  // update album
  void updateAlbum(List<Song> songs) {
    Map<int, Album> _albumsMap = {};
    for (Song song in songs) {
      if (_albumsMap[song.albumId] == null) {
        _albumsMap[song.albumId] = Album.fromSong(song);
      }
    }
    final List<Album> _albums = _albumsMap.values.toList();
    _albums$.add(_albums);
  }
}
