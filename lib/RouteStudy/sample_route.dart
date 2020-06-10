import 'package:flutter/material.dart';

class SampleRoute extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Route Demo"),
      ),
      body: Container(
          child: RaisedButton(
        child: new Text('点我'),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SampleRouteResult()));
        },
      )),
    );
  }
}

class SampleRouteResult extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Route Result"),
      ),
      body: Container(child: Text("Sample Route Page")),
    );
  }
}
