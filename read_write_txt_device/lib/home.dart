import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var enterDataController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("persistence"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        backgroundColor: Colors.blueGrey,
        body: new Container(
            padding: const EdgeInsets.all(12.0),
            child: new Column(
                children: <Widget>[
              new ListTile(
                title: new TextField(
                  controller: enterDataController,
                  textAlign: TextAlign.center,
                  decoration: new InputDecoration(
                    labelText: 'hi there again',
                  ),
                ),
              ),
              new ListTile(
                title: new FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    writeData(enterDataController.text);
                  },
                  child: new Text(
                    'save data & conpute',
                    style: new TextStyle(
                        color: Colors.redAccent.shade700,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
              new FutureBuilder(
                  future: readData(),
                  builder: (BuildContext context, AsyncSnapshot<String> data) {
                    if (data.hasData != null) {
                      return new Text(
                        data.data.toString(),
                        style: new TextStyle(color: Colors.white70),
                      );
                    } else {
                      return new Text("No data saved");
                    }
                  }),
              new ListTile(
                title: new FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    debugPrint('2nd btn');
//                    debugPrint(FutBu().toString().);
//                    debugPrint(""
//                        new FutureBuilder(
//                        future: readData(),
//                        builder: (BuildContext context, AsyncSnapshot<String> data) {
//                          if (data.hasData != null) {
////                            debugPrint('debug 2nd btn clkd');
//                            return new Text(
//                              data.data.toString(),
//                              style: new TextStyle(color: Colors.blue),
//                            );
//                            } else {
//                            return new Text("No data saved");
//                          }
//                        }
//                    );
//                    new Row(
//                      children: <Widget>[
////                        debugPrint('yeah'),
//                        new Text("howdie 62"),
//                      ],
//                        new FutureBuilder(
//                        future: readData(),
//                        builder: (BuildContext context, AsyncSnapshot<String> data) {
//                          if (data.hasData != null) {
////                            debugPrint('debug 2nd btn clkd');
//                            return new Text(
//                              data.data.toString(),
//                              style: new TextStyle(color: Colors.blue),
//                            );
//                            } else {
//                            return new Text("No data saved");
//                          }
//                        }
//                        ),
//                        );
                  },
                ),
              ),
                  new ListTile(
                    title: new Text(
                      'check if data present',
                      style: new TextStyle(
                          color: Colors.redAccent.shade200,
                          fontStyle: FontStyle.italic),
                    ),
                  )
            ])));
  }

  Future<String> get _localPath async {
    final directory =
        await getApplicationDocumentsDirectory(); //get app home folder image|path
    return directory.path; //home/directory
  }

  Future<File> get _localFile async {
    final _path = await _localPath;
    return new File(
        '$_path/dataset.txt'); //home/directory/dataset.txt    write file & name
  }

  Future<File> writeData(String message) async {
    final file = await _localFile;
    //write to dataset.txt file
    return file.writeAsString("$message");
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;
      String data = await file.readAsString();
      return data;
    } catch (e) {
      return "nothing saved yet";
    }
  }

  Future<String> FutBu() async {
    var data = readData();
  }
}
