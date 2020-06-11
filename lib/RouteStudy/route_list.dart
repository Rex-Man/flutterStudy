import 'package:flutter/material.dart';

import 'sample_route.dart';

class RouteStudy extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Study"),
      ),
      body: ListView(children: [
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Sample Route"),
            subtitle:Text("简单route的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SampleRoute()));
            })
      ]),
    );
  }
}