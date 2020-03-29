import 'package:flutter/material.dart';
import 'package:music_player/src/ui/music_homepage/music_homepage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          trackHeight: 1,
        ),
      ),
      home: SafeArea(
        child: MusicHomepage(),
      ),
    );
  }
}
