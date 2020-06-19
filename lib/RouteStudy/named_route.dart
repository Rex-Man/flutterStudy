import 'package:flutter/material.dart';

class NamedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Named Route Demo"),
      ),
        body: Container(
          alignment: Alignment.center,
          child: RaisedButton(
            child: new Text('点我'),
            onPressed: () {
               Navigator.pushNamed(context, "/namedrouteresult");
            },
          ),
        )
    );
  }
}
class NamedRouteResult extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Named Route Result"),
      ),
      body: Container(child: Text("Named Route Page")),
    );
  }
}
