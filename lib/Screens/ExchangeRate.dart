import 'dart:async';

import 'package:crypto_track/Utility/Networking.dart';
import 'package:flutter/material.dart';
import 'package:crypto_track/Utility/constants.dart';
import 'package:crypto_track/Utility/Card.dart';
import 'package:flutter/cupertino.dart';

class ExchangeRate extends StatefulWidget {
  const ExchangeRate({Key? key}) : super(key: key);

  @override
  _ExchangeRateState createState() => _ExchangeRateState();
}

class _ExchangeRateState extends State<ExchangeRate> {
  List<Widget> DisplayList= [];
  List<Text> CurrencyOptions = [];
  String  SelectedCurrency = 'AUD';
  bool active = true;


  @override
  void initState() {
    super.initState();
    UpdateUI(SelectedCurrency);
    getPickerItems();
  }

  Future<void> UpdateUI(String Currency)async{
    if(DisplayList != null){
      setState(() {
        DisplayList.clear();
        active = false;
      });

    }

    NetworkHelper h;

    for(String s in CryptoNameList){
      try {
        h = NetworkHelper(
            'https://rest.coinapi.io/v1/exchangerate/$s/$Currency?apikey=$ApiKey');
        var data = await h.getData();
        if (data != null) {
          double value = data['rate'];
          setState(() {
            DisplayList.add(CardBase(s, value.toInt()));
          });
        }else{
          setState(() {
            DisplayList.add(CardBase('0',0));
          });
        }
      }
      catch(e){
        setState(() {
          DisplayList.add(CardBase('0',0));
        });
        break;
      }
    }

    setState(() {
      active = true;
    });
  }

  List<Text> getPickerItems(){

    for(String s in currenciesList){
      CurrencyOptions.add(Text(s));
    }

    return CurrencyOptions;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(

        children: [
          Image.asset('images/2.jpg',fit: BoxFit.fill,height: double.infinity,width: double.infinity,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              //1st Card with Headers
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      backgroundBlendMode: BlendMode.hue,
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: HeadColorList, tileMode: TileMode.decal)),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Expanded(flex: 3,
                          child: Center(
                              child: Text('CryptoName', style: CardTextStyle,))),
                      Expanded(flex: 1,
                          child: Text(':', style: TextStyle(color: Colors.black87),)),
                      Expanded(flex: 2,
                          child: Text(SelectedCurrency,
                              style: CardTextStyle)),
                    ],
                  ),
                ),
              ),

              // Column with Data
              Expanded(
                child: ListView (
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: DisplayList,
                ),
              ),

              CupertinoPicker(itemExtent: 32,
                  diameterRatio: 4,
                  backgroundColor: Colors.white,
                  useMagnifier: true,
                  magnification: 2,
                  onSelectedItemChanged:(selectedIndex) {

                    if(active == true) {
                      setState(() {
                        SelectedCurrency = CurrencyOptions[selectedIndex].data!;
                        UpdateUI(SelectedCurrency);
                      });
                    };
                  },
                  children:getPickerItems()),
            ],
          ),
        ],
      ),
    );
  }
}
