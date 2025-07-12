import 'package:carrot_market/screens/components/appbar_preferred_size.dart';
import 'package:carrot_market/screens/neighborhood_life/components/life_body.dart';
import 'package:carrot_market/screens/neighborhood_life/components/life_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carrot_market/models/neighborhood_life.dart';

class NeighborhoodLifeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('동네생활'),
        actions: [
          IconButton(icon: Icon(CupertinoIcons.search), onPressed: () {}),
          IconButton(
            icon: Icon(CupertinoIcons.plus_rectangle_on_rectangle),
            onPressed: (){}),
          IconButton(icon: Icon(CupertinoIcons.bell), onPressed: () {}),
        ],
        bottom: appBarBottomLine(),
      ),
      body: ListView(
        children: [
          LifeHeader(),
          ...List.generate(
            neighborhoodLifeList.length,
              (index) =>
          Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: LifeBody(
          neighborhoodLife: neighborhoodLifeList[index],
          ),
          ),
          )
        ],
      ),
    );
  }
}