import 'package:flutter/material.dart';

class Library extends StatelessWidget {
  const Library({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SafeArea(child: Text("lib",style: TextStyle(color: Colors.white,backgroundColor: Colors.red),)));
  }
}
