import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';

class Home extends StatefulWidget {
//  Home({Key key, this.name2}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _nameFieldController = new TextEditingController();
  //final String name2;
  //constructor
  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      new MaterialPageRoute<Map>(
          builder: (BuildContext context) {
            return new NextScreen(name: _nameFieldController.text,);
          }
      )
    );
    if (results != null && results.containsKey('info')) {
      print(results['info']);
      _nameFieldController.text = results['info'];
    } else {
      print('nothing here');
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //Container();
      appBar: new AppBar(
        title: new Text("new page please"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,
      body: new ListView(children: <Widget>[
        new ListTile(
          title: new TextField(
            controller: _nameFieldController,
            decoration: new InputDecoration(
              labelText: 'input some data',
            ),
          ),
        ),
        new ListTile(
          title: new RaisedButton(
            onPressed: () {_goToNextScreen(context);},
//    {
//              var router =
//                  new MaterialPageRoute(builder: (BuildContext context) {
//                return new NextScreen(name: _nameFieldController.text);
//              });
//              Navigator.of(context).push(router);
//            }, //=> debugPrint('sending'),
            child: new Text(
              "send data to new page",
              style: new TextStyle(color: Colors.blue),
            ),
          ),
        ),
//        new ListTile(
//          title: new TextField(
//            controller: _name2FieldController,
//            decoration: new InputDecoration(
//              labelText: 'input 2',
//            ),
//          ),
//        ),

//        new ListTile(
//          title: new Text('${}'),
//        ),
      ]),
    );
  }
}

class NextScreen extends StatefulWidget {
//  var _name2FieldController = new TextEditingController();

  final String name;
  //constructor
  NextScreen({Key key, this.name}) : super(key: key);
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var _name2FieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('page 2'),
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: new Container(
        child: new Column(
          children: <Widget>[
            new ListTile(
              title: new Text('${widget.name}'),
            ),
            new ListTile(
              title: new TextField(
                controller: _name2FieldController,
                decoration: new InputDecoration(
                  labelText: 'input some data page 2',
                ),
              ),
            ),
            new ListTile(
              title: new RaisedButton(
                onPressed: () {
                  var router =
//                      new MaterialPageRoute(builder: (BuildContext context) {
//                    return new NextScreen(name: _name2FieldController.text);
//                  });
//                  Navigator.of(context).push(router);
                  Navigator.pop(context, {
                   'info': _name2FieldController.text
                  }
                  );
                }, //=> debugPrint('sending'),
                child: new Text(
                  "send data back to 1st page",
                  style: new TextStyle(color: Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
