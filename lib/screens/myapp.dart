import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/screens/library.dart';
import 'package:spotify/screens/search.dart';
import 'package:spotify/screens/home.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _audioPlayer = new AudioPlayer();
  var Tabs = [];
  int curretTabIndex = 0;

  Music? music;
  Widget miniplayer(Music? music) {
    this.music = music;
    setState(() {});
    if (music == null) {
      return SizedBox();
    }
    Size devicesize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(microseconds: 500),
      color: Colors.blueGrey,
      width: devicesize.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            music.image,
            fit: BoxFit.cover,
          ),
          Text(
            music.name,
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
              onPressed: () async{
                await _audioPlayer.play(music.audioURl);
              },
              icon: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    Tabs = [Home(miniplayer), Search(), Library()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Tabs[curretTabIndex],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          miniplayer(music),
          BottomNavigationBar(
            currentIndex: curretTabIndex,
            onTap: (currentIndex) {
              print("current Index is $currentIndex");
              curretTabIndex = currentIndex;
              setState(() {});
            },
            selectedLabelStyle: TextStyle(color: Colors.black),
            selectedItemColor: Colors.white,
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.white),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_music, color: Colors.white),
                  label: "library"),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.library_books, color: Colors.white),
                  label: "library"),
            
                
                
                  
                  
            ],
          ),
        ],
      ),
    );
  }
}
