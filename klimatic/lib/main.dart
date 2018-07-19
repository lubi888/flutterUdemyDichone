import 'package:flutter/material.dart';
import 'klimatic.dart';
//import 'utils.dart' as utils;
//Map _weather;
////Map _mainMap;
//String _mainMapString;
//String _main;
//double _temp;
//Map _mainMapName;
//Map _mainMapSys;
//String apiid = utils.apiID;
//String cc = utils.countryCode;
//String city = utils.city;

void main() {
//  _weather = await getWeather(apiid, city, cc);
//  _mainMapSys = _weather['sys'];
//  _mainMapString = _weather['sys']['country'];
////  _mainMapSysList = _weather['sys'];
//  _main = _weather['name'];
//  _mainMapName = _weather;
//  _temp = _weather['main']['temp'];
//  print(_main);
//  print(_mainMapName.length);
//  print(_mainMapSys.keys);
//  print(_mainMapString);
//  print(_mainMapString.length);
//  print(_temp);
//  print(_weather.toString());
  // print(_mainMapName.values);
  //assert( _main.isEmpty);
  runApp(new MaterialApp(
    title: 'klimate',
    home: new Klimatic(),
  ));
}

//Future<Map> getweather()  async {
//  String apiUrl =
//      'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
//  http.Response response = await http.get(apiUrl);
//  return json.decode(response.body);
//}
