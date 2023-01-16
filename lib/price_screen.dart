import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io'show Platform;
import 'package:http/http.dart';
class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}


class _PriceScreenState extends State<PriceScreen> {
  String selectedItem='USD';
   String BitCoin='?';
  String ETH='?';
  String LTC='?';

 Widget getDropDownList(){
    List<DropdownMenuItem<String>>dropDownList=[];
    for(String coin in  currenciesList){

     dropDownList.add(new DropdownMenuItem(child: Text('$coin'),value: coin,));
    }

    DropdownButton<String>dropdownButton= DropdownButton<String>(
      value:selectedItem,
      items:dropDownList,
      onChanged:(value){
        setState(() {

          getbitCoin();
          getethCoin();
          getltcCoin();
          selectedItem=value!;
        });
      } ,
    );
    return dropdownButton;

  }

  Widget getPicker(){
    List<Widget>pickerList=[];
    for(String coin in  currenciesList){

      pickerList.add(new Text(coin));
    }
   return CupertinoPicker(
        itemExtent: 30,
        onSelectedItemChanged: (int value) {
            selectedItem=currenciesList[value];
            getbitCoin();
            getethCoin();
            getltcCoin();
        },
        children:pickerList );
  }




 void getbitCoin()async{
   try{
    double value =await CoinData().getBetCoin(selectedItem);
    setState(() {
      BitCoin=value.toStringAsFixed(0);
    });}
catch(e){

    print(e);}

}
  void getethCoin()async{
    try{
      double value =await CoinData().getBetCoin(selectedItem);
      setState(() {
        ETH=value.toStringAsFixed(0);
      });}
    catch(e){

      print(e);}

  }
  void getltcCoin()async{
    try{
      double value =await CoinData().getBetCoin(selectedItem);
      setState(() {
        LTC=value.toStringAsFixed(0);
      });}
    catch(e){

      print(e);}

  }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getbitCoin();
   getethCoin();
   getltcCoin();
  }


  @override
  Widget build(BuildContext context){


       return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $BitCoin $selectedItem',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 ETH = $ETH $selectedItem',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 LTC = $LTC $selectedItem',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
