import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IntroParse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new IntroParseState(); //extends State<IntroParse>();
  }
}

class IntroParseState extends State<IntroParse> {
//  String _data = await getJSON();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("parse this"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.white70,
      body: new Container(
        child: new ListView(
          padding: new EdgeInsets.all(15.0),
          children: <Widget>[
            new Text(
              "try some json parsing here",
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            new Text($_data);
          ],
        ),
      ),
    );
  }
}

Future<String> getJSON() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/albums';
  http.Response respo = await http.get(apiUrl);
  return json.decode(respo.body);

}