import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List _data = await getJson(); //changed from string

  debugPrint(_data[0]['name']); //just a string
  //String _body = "";
  for (int i = 0; i < _data.length; i++) {
    print("Name ${_data[i]['name']}");
    print("email: ${_data[i]['email']}");
  }
  //_body = _data[0]['body'];
  runApp(new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('JSON Parse'),
            centerTitle: true,
            backgroundColor: Colors.orangeAccent,
          ),
          body: new Center(
            //    child: new Text(_body),
            child: new ListView.builder(
                itemCount: _data.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (BuildContext context, int position) {
                  //only printing odds. missing evens
//                  if (position.isOdd)
//                    return new Divider(
//                      color: Colors.deepPurple.shade900,
//                    );
                  final index =
                      position; // ~/ 2; // we are dividing position by 2
                  // and returning an integer result     //to change fact only returning odd id's? convert index + 1
                  return new ListTile(
                      dense: true, //density
                      title: new Text(
                          "${_data[index]['name']}", //was position => index
                          style: new TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontSize: 22.0,
                          )),
                      subtitle: new Text(
                        "${_data[index]['address']['zipcode']}",
                        style: new TextStyle(
                            color: Colors.orange,
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic),
                      ),
                      leading: new CircleAvatar(
                        backgroundColor: Colors.greenAccent.shade100,
                        child: new Text(
                          "${_data[index]['name'][0]
                              .toString()
                              .toUpperCase()}", //json to strng uppercase
                          style: new TextStyle(
                            fontSize: 22.0,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                      trailing: new CircleAvatar(
                        backgroundColor: Colors.greenAccent.shade100,
                        child: new Text(
                          "${_data[index]['name'][0]
                              .toString()
                              .toUpperCase()}", //json to strng uppercase
                          style: new TextStyle(
                            fontSize: 22.0,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
//                    onTap: ()=> debugPrint("${_data[position]['body']}"),
                      onTap: () {
                        _showOnTapMessage(context, "${_data[index]['address']['geo']['lat']}");
                      });
                }),
            //  var format = new DateFormat("yMd");
            //       var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['updated']*1000, isUtc: false));
          ))));
}

void _showOnTapMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: new Text('(App, List Item Body) Nested json trees'),
    content: new Text(message),
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
//      //child: alert;    //  showDialog(context: context, child: alert);    //deprecated
      builder: (context) {
        return alert;
      });
}

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  String apiUrl1 = 'https://jsonplaceholder.typicode.com/users';

  http.Response response = await http.get(apiUrl1);
  return json.decode(response.body); // returns a List type
}

/*
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List _data = await getJson(); //changed from string

  debugPrint(_data[0]['title']); //just a string
  //String _body = "";
  for (int i = 0; i < _data.length; i++) {
    print("Title ${_data[i]['title']}");
    print("Body: ${_data[i]['body']}");
  }
  //_body = _data[0]['body'];
  runApp(new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('JSON Parse'),
            centerTitle: true,
            backgroundColor: Colors.orangeAccent,
          ),
          body: new Center(
            //    child: new Text(_body),
            child: new ListView.builder(
                itemCount: _data.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (BuildContext context, int position) {
                  //only printing odds. missing evens
//                  if (position.isOdd)
//                    return new Divider(
//                      color: Colors.deepPurple.shade900,
//                    );
                  final index =
                      position; // ~/ 2; // we are dividing position by 2
                  // and returning an integer result     //to change fact only returning odd id's? convert index + 1
                  return new ListTile(
                      title: new Text(
                          "${_data[index]['title']}", //was position => index
                          style: new TextStyle(
                            color: Colors.greenAccent.shade700,
                            fontSize: 22.0,
                          )),
                      subtitle: new Text(
                        "${_data[index]['body']}",
                        style: new TextStyle(
                            color: Colors.orange,
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic),
                      ),
                      leading: new CircleAvatar(
                        backgroundColor: Colors.greenAccent.shade100,
                        child: new Text(
                          "${_data[index]['body'][0]
                              .toString()
                              .toUpperCase()}", //json to strng uppercase
                          style: new TextStyle(
                            fontSize: 22.0,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                      trailing: new CircleAvatar(
                        backgroundColor: Colors.greenAccent.shade100,
                        child: new Text(
                          "${_data[index]['body'][0]
                              .toString()
                              .toUpperCase()}", //json to strng uppercase
                          style: new TextStyle(
                            fontSize: 22.0,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
//                    onTap: ()=> debugPrint("${_data[position]['body']}"),
                      onTap: () {
                        _showOnTapMessage(context, "${_data[index]['body']}");
                      });
                }),
            //  var format = new DateFormat("yMd");
            //       var date = format.format(new DateTime.fromMicrosecondsSinceEpoch(_features[index]['properties']['updated']*1000, isUtc: false));
            //
))));
}

void _showOnTapMessage(BuildContext context, String message) {
  var alert = new AlertDialog(
    title: new Text('App, List Item Body'),
    content: new Text(message),
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
//      //child: alert;    //  showDialog(context: context, child: alert);    //deprecated
      builder: (context) {
        return alert;
      });
}

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  String apiUrl1 = 'https://jsonplaceholder.typicode.com/users';

  http.Response response = await http.get(apiUrl);
  return json.decode(response.body); // returns a List type
}
 */


