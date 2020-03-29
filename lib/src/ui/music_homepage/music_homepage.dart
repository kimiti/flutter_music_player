import 'package:flutter/material.dart';
import 'package:music_player/src/albums/albums_screen.dart';
import 'package:music_player/src/all_songs/all_songs_screen.dart';
import 'package:music_player/src/favorites/favorites_screen.dart';
import 'package:music_player/src/search/search_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MusicHomepage extends StatefulWidget {
  @override
  _MusicHomepageState createState() => _MusicHomepageState();
}

class _MusicHomepageState extends State<MusicHomepage> {
  PanelController _panelController;
  @override
  Widget build(BuildContext context) {
    final double _radius = 25.0;
    return Scaffold(
      body: SlidingUpPanel(
        panel: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_radius),
            topRight: Radius.circular(_radius),
          ),
        ),
        controller: _panelController,
        minHeight: 115,
        maxHeight: MediaQuery.of(context).size.height,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_radius),
          topRight: Radius.circular(_radius),
        ),
        collapsed: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_radius),
              topRight: Radius.circular(_radius),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.0,
                0.7,
              ],
              colors: [
                Color(0xFF47ACE1),
                Color(0xFFDF5F9D),
              ],
            ),
          ),
        ),
        body: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "music player",
                style: TextStyle(
                  color: Color(0xFF274D85),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              bottom: TabBar(
                indicatorColor: Color(0xFFD9EAF1),
                labelColor: Color(0xFF274D85),
                unselectedLabelColor: Color(0xFF274D85).withOpacity(0.6),
                tabs: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Songs",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Albums",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Favorites",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.search,
                      color: Color(0xFF274D85),
                      size: 35,
                    ),
                  ),
                )
              ],
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            body: TabBarView(
              key: UniqueKey(),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                AllSongsScreen(),
                AlbumsScreen(),
                FavoritesScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
