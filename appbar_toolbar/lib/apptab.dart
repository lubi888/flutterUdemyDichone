import 'package:flutter/material.dart';
//import 'main.dart';

class AppTab extends StatelessWidget {
  void _onPress() {
    print("that was a good tapo");
  }

  @override
  Widget build(BuildContext context) {
 //     assert(debugCheckHasMaterial(context)); //otherwise no InkWell
    //still no Scaffold    tried MaterialApp
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green.shade800,
        title: new Text("the title "
            "is aire"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.print),
              onPressed: () => debugPrint("whatever debugPrint console")),
          new IconButton(
              icon: new Icon(Icons.ac_unit),
              onPressed:
                  _onPress), //() => //debugPrint("ac_unit icons are up")),
        ],
      ),

      backgroundColor: Colors.black12, //overridden
      body: new Container(
        alignment: Alignment.center,
        color: Colors.black45,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "\n \u{132D1} \u{13080} \u{13000} \u{1339B}",
              style: new TextStyle(
                  color: Colors.green,
                  fontStyle: FontStyle.italic,
                  fontSize: 75.0),
            ),
//            new InkWell(
//              // When the user taps the button, show a snackbar
//              onTap: () {
//                Scaffold.of(context).showSnackBar(new SnackBar(
//                      content: new Text('Tap'),
//                    ));
//              },
//              child: new Text("whatever btn"),
////              child: new Container(
////                padding: new EdgeInsets.all(12.0),
////                child: new Text('Flat Button'),
////              ),
//            )

//            new InkWell(
//              child: new Text("button to press"),
//              onTap: () => debugPrint("buttn tapped "),
//            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          //onPressed: null,
          onPressed: () => debugPrint("thats the best fab"),
          backgroundColor: Colors.green,
          tooltip: "going up",
          child: new Icon(Icons.call_missed),
      ),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: new Icon(Icons.add),
            title: new Text("hey")),
        new BottomNavigationBarItem(icon: new Icon(Icons.search), title: new Text("coolio")),
      ],
      //anon function must take int
      onTap: (int i) => debugPrint("you pressed item $i"),
      ),
    );
  }
}
