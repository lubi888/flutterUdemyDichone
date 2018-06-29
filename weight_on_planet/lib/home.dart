import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState(); // extends StatefulWidget();
  }
}

class HomeState extends State<Home> {
  int radioValue = 0;
  int weightValue;
  String _weight;
  String _newton = "F = G((M1*M2)/r^2)";
  double _finalResult = 0.0;
  final TextEditingController _weightController = new TextEditingController();
  String _formattedText;
  String _weightText;
  /*
  Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06
  */
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value; //print(radioValue);
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedText =
              "You weight on Pluto is ${_finalResult.toStringAsFixed(2)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText =
              "You weight on Mars is ${_finalResult.toStringAsFixed(2)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedText =
              "You weight on Venus is ${_finalResult.toStringAsFixed(2
              )}";
          break;
      }
    });
  }

  void handleWeightValueChanged(int value) {
    setState(() {
      weightValue = value;
      switch (weightValue) {
        case 0:
          _weightText = "lbs";
          break;
        case 1:
          _weightText = "kgs";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("weighty matey"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'assets/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number, //number keyboard
                    decoration: new InputDecoration(
                      labelText: "your weight on eatha",
                      hintText: "in kg's",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        'pluto dog',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          color: Colors.brown.shade400,
                        ),
                      ),
                      new Radio<int>(
                          activeColor: Colors.redAccent,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        'marsy parsy',
                        style: new TextStyle(
                          color: Colors.redAccent.shade400,
                        ),
                      ),
                      new Radio<int>(
                          activeColor: Colors.orange,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "venus hotus",
                        style: new TextStyle(color: Colors.deepOrange.shade400),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                          activeColor: Colors.redAccent,
                          value: 0,
                          groupValue: weightValue,
                          onChanged: handleWeightValueChanged),
                      new Text("imperial weight"),
                      new Radio<int>(
                          activeColor: Colors.blueAccent,
                          value: 1,
                          groupValue: weightValue,
                          onChanged: handleWeightValueChanged),
                      new Text("metric weight"),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.0)),
                  new Text(
                    _weightController.text.isEmpty
                        ? "enter a weight"
                        : "howdie, the button is now $radioValue"
                        // "\nand the weight entered was $_weight"
                        // "\nNewton helps us with the Law for Gravitational Constant"
                        "\n$_newton."
                        "\nAnd your weight on planet X is $_finalResult"
                        "\n$_formattedText"
                        "\n$_weightText",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int
            .parse(weight)
            .toString()
            .isNotEmpty //string -> int -> string -> NotEmpty. Rewrite.
        &&
        int.parse(weight) > 0) {
      return double.parse(weight) * multiplier;
    } else {
      print("wrong!");
      return (int.parse(weight) * 0.38);
    }
  }
}
