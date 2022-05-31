import 'package:flutter/material.dart';

final ThemeData darkThemeOLED = new ThemeData(
  brightness: Brightness.dark,
  accentColor: Colors.deepPurpleAccent[100],
  primaryColor: Color.fromRGBO(5, 5, 5, 1.0),
  backgroundColor: Colors.black,
  canvasColor: Colors.black,
  primaryColorLight: Colors.pinkAccent[300],
  buttonColor: Colors.deepPurpleAccent[100],
  accentIconTheme: new IconThemeData(color: Colors.deepPurple[300]),
  cardColor: Color.fromRGBO(16, 16, 16, 1.0),
  dividerColor: Color.fromRGBO(20, 20, 20, 1.0),
  bottomAppBarColor: Color.fromRGBO(19, 19, 19, 1.0),
  dialogBackgroundColor: Colors.black,
  textSelectionHandleColor: Colors.deepPurpleAccent[100],
  iconTheme: new IconThemeData(color: Colors.white),
);

const ApiKey = '1B6E29DF-2E8F-45AE-867E-7C89A5609D5D';

List <Color> CardColorList =[Colors.teal,Colors.tealAccent,Colors.purpleAccent];
List<Color> HeadColorList=[Colors.amber,Colors.pinkAccent,Colors.red];
const TextStyle CardTextStyle = TextStyle(fontSize: 25,color: Colors.black54);

List<String> CryptoNameList = [
  'BTC',
  'ETH',
  'LTC',
  'BNB',
  'MATIC',
  'XRP',

];

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
