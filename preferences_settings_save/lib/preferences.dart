import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  var _enterDataField = new TextEditingController();
  String _savedData = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getString('data') != null) {
        _savedData = preferences.getString('data');
      } else {
        _savedData = "empty prefszzz";
      }
    });
  }

  _saveMessage(String message) async {
    SharedPreferences preferences =
        await SharedPreferences.getInstance(); //  getInstance();
    preferences.setString('data', message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('prefs save'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        padding: const EdgeInsets.all(5.0),
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new TextField(
                  controller: _enterDataField,
                  textAlign: TextAlign.center,
                  autofocus: true,
                  keyboardType: TextInputType.numberWithOptions(),
                  decoration: new InputDecoration(
                    labelText: 'hi there, enter s\'thin\'',
                    labelStyle: new TextStyle(
                      color: Colors.lightGreen,
//                    background: Colors.yellow,
                    ),
                  )),
            ),
            new ListTile(
              title: new FlatButton(
                color: Colors.lightGreen,
                onPressed: () {
                  debugPrint('butn pressed');
//                writeData(_.text);
                  _saveMessage(_enterDataField.text); //message
                }, //new Text('${_prefsTextController.text}',
                child: new Text(
                  'Tap to check saved: $_savedData',
                  style: new TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            new ListTile(
              title: new Text('$_savedData',
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Colors.lightGreen,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
