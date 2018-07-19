import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Map _mapQuakes;
List _features;
//var _unixTime; // = new DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch);

void main() async {
  _mapQuakes = await getQuakes();
  _features = _mapQuakes['features'];
  print(_mapQuakes.length);
  print(_features.length);
  print(_mapQuakes['features'][0]['properties']);
  runApp(
    new MaterialApp(title: "title 1", home: new Quakes()),
  );
}

class Quakes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("title 2 quakes json"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: new Center(
        child: new ListView.builder(
            itemCount: _features.length,
            padding: EdgeInsets.all(16.0),
            itemBuilder: (BuildContext context, int position) {
//                  if(position.isOdd) return new Divider(color: Colors.pink);
              final _index = position; // ~/2
              var _unixTime = new DateTime.fromMicrosecondsSinceEpoch(
                _features[_index]['properties']['time'] * 1000,
                isUtc: true,
              );
//              var format = new DateFormat('yMd');
              var format =
                  new DateFormat('EEEE d/M/yy h:m:s a'); //use Hms(); for 24hour
              var dateString = format.format(_unixTime);

              return new ListTile(
                  dense: true,
                  title: new Text(
                    "At: $_unixTime"
                        "\naka $dateString",
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  subtitle: new Text(
                    "Location: ${_features[position]['properties']['place']}",
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.brown,
                    ),
                  ),
                  trailing: new CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    child:
                        new Text("${_features[position]['properties']['mag']}"),
                  ),
                  //onTap: ()=> debugPrint("json quakes"),
                  onTap: () {
                    _showOnTapMessage(
                        context, "${_features[position]['properties']['mag']}");
                  });
            }),
      ),
    );
  }
}

void _showOnTapMessage(BuildContext context, String s) {
  var alert = new AlertDialog(
    title: new Text('(App, List Item Body) Nested json trees'),
    content: new Text(s),
    actions: <Widget>[
      new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('OK'))
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return alert;
      });
}

Future<Map> getQuakes() async {
  String apiUrl =
      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
  http.Response response = await http.get(apiUrl);
  return json.decode(response.body);
}
