import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'utils.dart' as utils;
import 'main.dart' as main;

class Klimatic extends StatefulWidget {
  @override
  _KlimaticState createState() => _KlimaticState();
}

class _KlimaticState extends State<Klimatic> {
//  String _mainMapString;
//  String _main;
//  double _temp;
//  Map _mainMapSys;
//
  String _cityEntered;
//
  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator
        .of(context)
        .push(new MaterialPageRoute<Map>(
        builder: (BuildContext context) { //change to map from dynamic
          return new ChangeCity();
        }));
    if (results != null && results.containsKey('enter')) {
      _cityEntered = results['enter'];
    }
  }
//
    void showStuff() async {
      Map _weather = await getWeather(utils.apiID, utils.city);
//      _mainMapSys = _weather['sys'];
//      _mainMapString = _weather['sys']['country'];
//      _main = _weather['name'];
//      //_mainMapName = _weather;
//      _temp = _weather['main']['temp'];
      debugPrint(_weather.toString());
//      print(_main);
//      print(_mainMapSys.keys);
//      print(_mainMapString);
//      print(_mainMapString.length);
//      print(_temp);
//      print(_weather.toString());
    }

    @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "klimatic json",
          ),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () {
                  _goToNextScreen(context);
                } //showStuff, //() => debugPrint('ola'),
            ),
          ],
        ),
        body: new Stack(
          children: <Widget>[
            new Center(
              child: new Image.asset(
                "assets/umbrella.png",
                width: 380.0,
                height: 700.0,
                fit: BoxFit.fill,
                //double.parse(BoxFit.fill),
              ),
            ),
            new Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 0.0),
              child: new Text(
                '$_cityEntered', //city, //utils.city, //"city",
                textDirection: TextDirection.ltr,
                style: cityStyle(),
              ),
            ),
            new Container(
              alignment: Alignment.centerLeft,
              child: new Image.asset("assets/light_rain.png"),
            ),
            new Container(
              alignment: Alignment.bottomRight,
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 20.0),
              child: updateTempWidget(_cityEntered ),       //"lisbon"),
//            child: new Text(
//              '$_temp',//"44.4",//'$_temp',              //"44.4",
//              style: tempStyle(),
//            ),
            ),
            new Container(
              alignment: Alignment.bottomLeft,
              child: new RaisedButton(onPressed: showStuff),
            ),
          ], a 
        ),
      );
    }

    Future<Map> getWeather(String apiid, String city) async {
      //String apiUrl =
      //    "http://api.openweathermap.org/data/2.5/weather?q=dublin,IE&appid=ff319520bcd3c4b15c4b43ddb75903f6";
      String apiUrl =
          "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=${utils
          .apiID}${utils.metric}";
      http.Response response = await http.get(apiUrl);
      return json.decode(response.body);
    }

    Widget updateTempWidget(String city) {
      return new FutureBuilder(
          future: getWeather(utils.apiID, city == null ? utils .defaultCity : city),
          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
            //get all json, setup widgets
            if (snapshot.hasData) {
              Map content = snapshot.data;
              return new Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 20.0),
                child: new Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new ListTile(
                      title: new Text(
                        content['main']['temp'].toString(),
                        style: tempStyle(),
//                        style: new TextStyle(
//                          color: Colors.redAccent,
//                          fontSize: 20.0,
//                          fontWeight: FontWeight.bold,
//                        )
                      ),
                      //_temp.toString()),       //(content['main']),
                    ),
                  ],
                ),
              );
            } else {
              return new Container();
            }
          });
  }
}

class ChangeCity extends StatelessWidget {
  var _cityFieldController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("klimatic dropdown city"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: new Stack(
        children: <Widget>[
          new Center(
            child: new Image.asset(
//              "assets/umbrella.png",
              'assets/white_snow.png',
              width: 350.0,
              height: 700.0,
//              fit: BoxFit.fill,
            ),
          ),
          new ListView(
            children: <Widget>[
              new ListTile(
                title: new TextField(
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: Colors.purple),
                  decoration: new InputDecoration(
                    icon: new Icon(Icons.location_city),
                    hintText: "input a city side",
                    hintStyle: new TextStyle(color: Colors.orangeAccent),
                  ),
                  controller:       _cityFieldController,
                  keyboardType: TextInputType.text,
                ),
              ),
              new ListTile(
                title: new FlatButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        'enter': _cityFieldController.text
                      });
                    },
                    textColor: Colors.white70,
                    color: Colors.redAccent,
                    child: new Text('Get Weather')),
              ),
            ],
          )
        ],
      ),
    );
  }
}

TextStyle cityStyle() {
  return new TextStyle(
      color: Colors.redAccent,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);
}

TextStyle tempStyle() {
  return new TextStyle(
    color: Colors.yellowAccent,
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );
}
