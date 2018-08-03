import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


void main () {
  runApp(new MaterialApp(
    title: 'db sql ',
    theme: new ThemeData(
//      return null;
    ),
    home: new DB(),
  ));
}

class DB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("db sqf lite"),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}
