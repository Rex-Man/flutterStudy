import 'package:flutter/material.dart';

class SampleRouteParam extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Router Param Demo"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          child: new Text('点我'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    SampleRouteParamResult(title: "简单Router传值")));
          },
        ),
      ),
    );
  }
}

class SampleRouteParamResult extends StatelessWidget {
  final String title;

  const SampleRouteParamResult({Key key, this.title}) : super(key: key);
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${title}"),
      ),
      body: Container(
        child: Text("简单传值方式"),
      ),
    );
  }
}
