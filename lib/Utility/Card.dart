import 'package:crypto_track/Utility/constants.dart';
import 'package:flutter/material.dart';


Widget CardBase(String cryptoname,int cryptovalue) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 100,
      width: double.maxFinite,
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.hue,
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
              colors: CardColorList, tileMode: TileMode.decal)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Expanded(flex: 3,
              child: Center(
                  child: Text(cryptoname, style: CardTextStyle))),
          Expanded(flex: 1,
              child: Text(':', style: TextStyle(color: Colors.black87),)),
          Expanded(flex: 2,
            child: Text(cryptovalue.toStringAsFixed(0),
                style: CardTextStyle),),
        ],
      ),
    ),
  );
}