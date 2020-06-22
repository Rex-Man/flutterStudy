import 'package:flutter/material.dart';

class NamedOnGenerateRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Use OnGenerate Route Way"),
      ),
      body: Container(
        child: Text("This is Use OnGenerate Route Function "),
        ),
    );
  }
}

class NamedOnGenerateRouteParam extends StatelessWidget{
  final arguments;

  const NamedOnGenerateRouteParam({Key key, this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("Use OnGenerate Route Way"),
      ),
      body: Container(
        child: Text("This is Use OnGenerate Route Function ${arguments !=null? arguments['title']:'no arguments'} "),
        ),
    );
  }

}