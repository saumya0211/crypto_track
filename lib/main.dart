import 'package:crypto_track/Utility/constants.dart';
import'package:flutter/material.dart';
import 'package:crypto_track/Screens/ExchangeRate.dart';
void main(){

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Center(child:Text('Bit Track',style: TextStyle(fontSize: 20,color:Colors.white),)),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ExchangeRate(),
    ),
  ),
  );
}
