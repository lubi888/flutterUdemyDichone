import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginState(); //extends State<Login>();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwdController = new TextEditingController();
  String _welcomeString = "";
  String _welcomePwdString;

  void _erase() {
    setState(() {
      _userController.clear();
      _passwdController.clear();
      _welcomeString = "";
      _welcomePwdString = "";
    });
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwdController.text.isNotEmpty) {
        _welcomeString = _userController.text;
        _welcomePwdString = _passwdController.text;
      } else {
        _welcomeString = "missing data entry";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Screen"), //"login screen",
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          //Column
          children: <Widget>[
            new Image.asset(
              'assetts/face.png',
              width: 90.0,
              height: 90.0,
              color: Colors.greenAccent,
            ),
            new Container(
              color: Colors.greenAccent,
              height: 180.0,
              width: 380.0,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: 'input username',
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _passwdController,
                    decoration: new InputDecoration(
                      hintText: 'input passwd',
                      icon: new Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(15.0)),
                  new Center(
                      child: new Row(children: <Widget>[
                    new Container(
                        margin: const EdgeInsets.only(left: 38.0),
                        child: new RaisedButton(
                          onPressed:
                              _showWelcome, //() => debugPrint("inputted details"),
                          color: Colors.redAccent,
                          child: new Text('enter',
                              style: new TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 19.5,
                              )),
                        )),
                    new Container(
                        margin: const EdgeInsets.only(left: 110.0),
                        child: new RaisedButton(
                          onPressed: _erase, //debugPrint("fields cleared"),
                          color: Colors.redAccent,
                          child: new Text('clear',
                              style: new TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 19.5,
                              )),
                        )),
                  ])),
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "how was that form, $_welcomeString,"
                      "\nyour pwd entered was $_welcomePwdString",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            // form ends here
          ],
        ),
      ),
    );
  }
}

//class _userController {}
