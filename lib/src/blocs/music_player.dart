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
}
