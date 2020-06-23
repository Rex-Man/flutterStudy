import 'package:flutter/material.dart';

class TabBike extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.directions_bike),
          Text('TabBike')
        ],
      ),
    );
  }
}