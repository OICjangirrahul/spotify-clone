import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify/models/category.dart';
import 'package:spotify/models/music.dart';
import 'package:spotify/services/categroy_operations.dart';
import 'package:spotify/services/music_operations.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget createCategory(Category category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Image.network(category.imgUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              category.name,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createListOfCategory() {
    List<Category> categoryList = Categoryoperation.getCategories();
    List<Widget> categories = categoryList
        .map((Category category) => createCategory(category))
        .toList();
    return categories;
  }

  createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.network(
              music.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(music.name,style: TextStyle(color: Colors.white),),
          Text(music.desc,style: TextStyle(color: Colors.white),),
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic();
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("Made for you",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          Container(
            height: 300,

            child: ListView.builder(
              
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: createListOfCategory(),
        crossAxisCount: 2,
      ),
    );
  }

  Widget createAppBar(String mess) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(mess),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(Icons.settings),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: SafeArea(
      child: Container(
        child: Column(
          children: [
            createAppBar("Good Morning"),
            SizedBox(
              height: 5,
            ),
            createGrid(),
            createMusicList('music for you'),
            createMusicList('Popular playlist')
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey.shade300, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3])),
      ),
    ));
  }
}
