import 'package:flutter/material.dart';

import 'customer_route.dart';
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
            subtitle: Text("简单route的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SampleRoute()));
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Sample Route Param"),
            subtitle: Text("简单route传参数的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(FadeRoute(
                  builder: (context) => SampleRouteParam())); // 这里应用了自定义的route
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Named Route"),
            subtitle: Text("命名route的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/namedroute');
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Named Route Param"),
            subtitle: Text("命名route传参数的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/namedrouteparam');
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Named Route Return"),
            subtitle: Text("命名route传返回值的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/namedroutereturn');
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Named OnGenerate "),
            subtitle: Text("命名routeGenerate的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/ongenerateroute');
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Named OnGenerate Param "),
            subtitle: Text("命名routeGenerate传递参数的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/ongeneraterouteparam',
                  arguments: {"title": "Pass Param To"});
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("HeroAnimationRoute "),
            subtitle: Text("HeroAnimationRoute的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, '/heroanimationroute');
            })
      ]),
    );
  }
}
