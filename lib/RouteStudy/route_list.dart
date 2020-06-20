import 'package:flutter/material.dart';

import 'sample_route.dart';
import 'sample_route_param.dart';

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
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Sample Route Param"),
            subtitle:Text("简单route传参数的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SampleRouteParam()));
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Named Route"),
            subtitle:Text("命名route的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/namedroute');
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Named Route Param"),
            subtitle:Text("命名route传参数的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/namedrouteparam');
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Named Route Param"),
            subtitle:Text("命名route传返回值的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/namedroutereturn');
            }),
      ]),
    );
  }
}
