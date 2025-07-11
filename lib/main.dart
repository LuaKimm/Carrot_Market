import 'package:carrot_market/screens/main_screens.dart';
import 'package:carrot_market/theme.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(CarrotMarketUI());
}

class CarrotMarketUI extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'carrot_Market',
      debugShowCheckedModeBanner: false,

      home: MainScreens(),
      theme: theme(),
    );
  }
}