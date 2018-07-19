final apiID = 'ff319520bcd3c4b15c4b43ddb75903f6';
final apiIDextended = '&appid=$apiID';
final _userID = '101';
final _userPWD = '101openweather';
final apiURL = 'http://api.openweathermap.org/data/2.5/weather?q=';

final metric = '&units=metric';
final imperial = '&units=imperial';

//final external factory String.fromCharCode(int \u{0x2C});

String char = ',';
String defaultCity = 'Dublin, IE';
String city = 'durban';
String countryCode = 'ZA';
final defaultSearch = '$apiURL$city$char$countryCode$apiIDextended$metric';
final newSearch = '$apiURL$city$char$countryCode$apiIDextended$metric';
/*
http://api.openweathermap.org/data/2.5/weather?q=london&appid=ff319520bcd3c4b15c4b43ddb75903f6

http://api.openweathermap.org/data/2.5/weather?q=dublin,IE&appid=ff319520bcd3c4b15c4b43ddb75903f6
http://api.openweathermap.org/data/2.5/weather?q=durban,ZA&appid=ff319520bcd3c4b15c4b43ddb75903f6

http://api.openweathermap.org/data/2.5/weather?q=$_city,$_countrCodey&appid=ff319520bcd3c4b15c4b43ddb75903f6

*/
