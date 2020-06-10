import 'package:flutter/material.dart';

import 'sample_route.dart';

class RouteStudy extends StatelessWidget {
  @override
  Widget build(Object context) {
    return ListView(children: [
      ListTile(
          title: Text("Sample Route"),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SampleRoute()));
          })
    ]);
  }
}
