import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify/models/category.dart';
import 'package:spotify/services/categroy_operations.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget createCategory(Category category) {
    return Container(
      color: Colors.blueGrey.shade400,
      child: Row(
        children: [
          Image.network(category.imgUrl, fit: BoxFit.cover),
          Text(
            category.name,
            style: TextStyle(color: Colors.white),
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

  Widget createGrid() {
    return Container(
      height: 400,
      child: GridView.count(
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
    return Center(
        child: SafeArea(
      child: Container(
        child: Column(
          children: [createAppBar("Good Morning"),
          SizedBox(
            height: 5,
          ),
          createGrid()
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
