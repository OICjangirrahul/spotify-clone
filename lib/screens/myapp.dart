import 'package:flutter/material.dart';
import 'package:spotify/screens/library.dart';
import 'package:spotify/screens/search.dart';
import 'package:spotify/screens/home.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Tabs = [Home(), Search(),Library()];
  int curretTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Tabs[curretTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curretTabIndex,
        onTap: (currentIndex) {
          print("current Index is $currentIndex");
          curretTabIndex = currentIndex;
          setState(() {
            
          });
      
        },
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.white), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_check,color: Colors.white),label: "library"),
        ],
      ),
    );
  }
}
