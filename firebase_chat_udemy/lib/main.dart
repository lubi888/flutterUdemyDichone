import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_chat_udemy/model/board.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Board> boardMessages = List();
  Board board;
  final FirebaseDatabase dbfire = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatabaseReference dbref;

  @override
  void initState() {
    super.initState();
    board = Board("", "");
    dbref = dbfire.reference().child("community_scoreboard");
    dbref.onChildAdded.listen(_onEntryAdded);
    dbref.onChildChanged.listen(_onEntryChanged);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("post board"),
      ),
      body: new Column(
        children: <Widget>[
          Flexible(
            flex: 0,
            child: Center (
            child: Form(
              key: formKey,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.subject),
                    title: new TextFormField(
                      initialValue: "",
                      onSaved: (val) => board.subject = val,
                      validator: (val) => val == "" ? val : null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: new TextFormField(
                      initialValue: "",
                      onSaved: (val) => board.body = val,
                      validator: (val) => val == "" ? val : null,
                    ),
                  ),
                  FlatButton(
                    child: Text("+post"),
                    color: Colors.yellowAccent,
                    onPressed: () {
                      handleSubmit();
                    },
                  )
                ],
              ),
            ),
          ),
          ),
          Flexible(
//            flex: 0,
            child: FirebaseAnimatedList(
              query: dbref,
              itemBuilder: (_, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return new Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.lightGreenAccent,
                    ),
                    title: Text(boardMessages[index].subject),
                    subtitle: Text(boardMessages[index].body),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onEntryAdded(Event event) {
    setState(() {
      boardMessages.add(Board.fromSnapshot(event.snapshot));
    });
  }

  void _onEntryChanged(Event event) {
    var oldEntry = boardMessages.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      boardMessages[boardMessages.indexOf(oldEntry)] =
          Board.fromSnapshot(event.snapshot);
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      form.save();
      form.reset();
      dbref.push().set(board.toJson());
    }
  }

}

//
//
//import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase_database/ui/firebase_animated_list.dart';
////import 'package:firebase_setup/model/board.dart';
//import 'package:flutter/material.dart';
//import 'package:firebase_chat_udemy/model/board.dart';
//
//
//void main() => runApp(new MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Community Board',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: new MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  List<Board> boardMessages = List();
//  Board board;
//  final FirebaseDatabase database = FirebaseDatabase.instance;
//  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//  DatabaseReference databaseReference;
//
//  @override
//  void initState() {
//    super.initState();
//
//    board = Board("", "");
//    databaseReference = database.reference().child("community_board");
//    databaseReference.onChildAdded.listen(_onEntryAdded);
//    databaseReference.onChildChanged.listen(_onEntryChanged);
//  } //  void _incrementCounter() {
////    database.reference().child("messge").push().set({
////       "firstname" : "iOS",
////      "lastname" : "X",
////      "age" : 1
////    });
//
//    database
//        .reference()
//        .child("message")
//        .set({"firstname": "iOS", "Lastname": "X", "Age": 1});
//
//    setState(() {
//      database
//          .reference()
//          .child("message")
//          .once()
//          .then((DataSnapshot snapshot) {
//        Map<dynamic, dynamic> data = snapshot.value;
//
//        print("Values from db: ${snapshot.value}");
//      });
//
//      _counter++;
//    });
//  }

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("Board"),
//      ),
//      body: Column(
//        children: <Widget>[
//          Flexible(
//            flex: 0,
//            child: Center(
//              child: Form(
//                key: formKey,
//                child: Flex(
//                  direction: Axis.vertical,
//                  children: <Widget>[
//                    ListTile(
//                      leading: Icon(Icons.subject),
//                      title: TextFormField(
//                        initialValue: "",
//                        onSaved: (val) => board.subject = val,
//                        validator: (val) => val == "" ? val : null,
//                      ),
//                    ),
//
//                    ListTile(
//                      leading: Icon(Icons.message),
//                      title: TextFormField(
//                        initialValue: "",
//                        onSaved: (val) => board.body = val,
//                        validator: (val) => val == "" ? val : null,
//                      ),
//                    ),
//
//                    //Send or Post button
//                    FlatButton(
//                      child: Text("Post"),
//                      color: Colors.redAccent,
//                      onPressed: () {
//                        handleSubmit();
//                      },
//                    )
//                  ],
//                ),
//              ),
//            ),
//          ),
//          Flexible(
//            child: FirebaseAnimatedList(
//              query: databaseReference,
//              itemBuilder: (_, DataSnapshot snapshot,
//                  Animation<double> animation, int index) {
//                return new Card(
//                  child: ListTile(
//                    leading: CircleAvatar(
//                      backgroundColor: Colors.red,
//                    ),
//                    title: Text(boardMessages[index].subject),
//                    subtitle: Text(boardMessages[index].body),
//                  ),
//                );
//              },
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  void _onEntryAdded(Event event) {
//    setState(() {
//      boardMessages.add(Board.fromSnapshot(event.snapshot));
//    });
//  }
//
//  void handleSubmit() {
//    final FormState form = formKey.currentState;
//    if (form.validate()) {
//      form.save();
//      form.reset();
//      //save form data to the database
//      databaseReference.push().set(board.toJson());
//    }
//  }
//
//  void _onEntryChanged(Event event) {
//    var oldEntry = boardMessages.singleWhere((entry) {
//      return entry.key == event.snapshot.key;
//    });
//
//    setState(() {
//      boardMessages[boardMessages.indexOf(oldEntry)] =
//          Board.fromSnapshot(event.snapshot);
//    });
//  }
//}