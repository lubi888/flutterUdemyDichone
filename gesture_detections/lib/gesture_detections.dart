import 'package:flutter/material.dart';

class GestureDetections extends StatelessWidget {
  final String title;

  GestureDetections({Key key, this.title})
      : super(key: key); //:  "gestures to this"
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange.shade400,
        title: new Text(title),
      ),
      body: new Center(
        child: new customButton(),
      ),
    );
  }
}

class customButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        final snackbar = new SnackBar(
          content: new Text(
            "swell gestures",
            textAlign: TextAlign.right,
          ),
          backgroundColor: Theme
              .of(context)
              .backgroundColor, //secondaryHeaderColor, //backgroundColor,
          duration: new Duration(
              hours: 0,
              minutes: 0,
              seconds: 2,
              milliseconds: 0, //2000
              microseconds: 0),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      },
      child: new Container(
        padding: new EdgeInsets.all(18.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(5.5),
        ),
        child: new Text("1st guttn"),
      ),
    );
  }
}
