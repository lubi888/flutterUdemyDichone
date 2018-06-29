import 'package:flutter/material.dart';

class MakeItRain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MakeItRainState();
  }
}

class MakeItRainState extends State<MakeItRain> {
  int _moneyCounter = 0;

  void _rainMoney() {
    setState(() {
      if (_moneyCounter > 300) {
        debugPrint("a highflyer, get him||her. \n change the text colour");
        debugPrint("balance is now $_moneyCounter+100");
      } else {
        debugPrint("lowlife");
      }
      _moneyCounter += 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var _make = _moneyCounter;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("make it rain"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Center(
              child: new Text(
                "Get Rich Quick Prog",
                style: new TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 30.0),
              ),
            ),
            new Expanded(
                child: new Center(
              child: new Text("\$$_moneyCounter", //\$ money honey !",
                  style: new TextStyle(
                      color: _moneyCounter > 400
                          ? Colors.deepOrange
                          : Colors.greenAccent,
                      fontSize: 47.0,
                      fontWeight: FontWeight.w800)),
            )),
            new Expanded(
                child: new Center(
              child: new FlatButton(
                  color: Colors.lightGreen,
                  textColor: Colors.white70,
                  //onPressed: () => debugPrint("hey there"),
                  onPressed: _rainMoney,
                  child: new Text(
                    "learn some code",
                    style: new TextStyle(
                        //color: Colors.grey,
                        fontSize: 20.0),
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
