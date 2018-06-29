import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMIState();
  }
}

class BMIState extends State<BMI> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();

  double _bmi;
  String _bmiResult;
  //BMI = (Kg/(Height^2))*10000;   height in cm's not m's.
  //underweight = < 18.5, overweight = > 25.0-29.0, obesce => 30.0
  void calculateBMI() {
    //_ageController, _weightController, _heightController) {
    setState(() {
      int _age = int.parse(_ageController.text);
      double _weight = double.parse(_weightController.text);
      double _height = double.parse(_heightController.text);

      if ((_ageController.text.isNotEmpty || _age > 0) &&
          (_weightController.text.isNotEmpty || _weight > 0) &&
          (_heightController.text.isNotEmpty || _height > 0)) {
        _bmi = ((_weight / (_height * _height)) * 10000.0);
      } else {
        _bmi = 0.0;
      }
      if (_bmi < 18.5) {  //(double.parse(_bmi.toStringAsFixed(2)) < 18.5)
        _bmiResult = "underweight";
      } else if (_bmi >= 18.5 && _bmi < 25.0) {
        _bmiResult = "normal plonk, good shape";
      } else if (_bmi >= 25.0 && _bmi < 30.0) {
        _bmiResult = "overweight";
      } else {
        _bmiResult = "obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("bmi calcs"), //"bmi calcs",
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.white70,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: new EdgeInsets.all(3.0),
          children: <Widget>[
            new Image.asset(
              'assets/bmilogo.png',
              height: 75.0,
              width: 75.0,
            ),
            new Text(
              "howdie",
              textAlign: TextAlign.center,
            ),
            new Container(
              padding: new EdgeInsets.all(3.0),
              height: 265.0,
              color: Colors.grey.shade400,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.numberWithOptions(), //number
                    decoration: new InputDecoration(
                      labelText: "Age if you will",
                      hintText: "when you're 64",
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "how tall are u? in cm's not m's",
                      hintText: "hey 175",
                      icon: new Icon(Icons.account_box),
                    ),
                  ),
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: new InputDecoration(
                      labelText: "weight in kg's",
                      hintText: "kg's",
                      icon: new Icon(Icons.headset),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(15.0)),
                  //new container?
                  new RaisedButton(
                    // ignore: argument_type_not_assignable
                    onPressed: calculateBMI, //() => print(
                    //'hello'), //null,//CalculateBMI(_ageController, _weightController, _heightController),           //null,
                    color: Colors.pinkAccent,
                    child: new Text(
                      "calculate",
                      style: new TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center, //height: 250.0,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(6.0),
                ),
                new Text(
                  "BMI: ${_bmi}", //${_BMI.toString()}",
                  style: new TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                    fontSize: 25.0,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(6.0),
                ),
                new Text(
                  "overweight or underweight:"
                      "\n$_bmiResult",
                  style: new TextStyle(
                    color: Colors.pinkAccent,
                    height: 2.0,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}