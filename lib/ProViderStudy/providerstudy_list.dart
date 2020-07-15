import 'package:flutter/material.dart';

import 'changeNotifierProviderStudy.dart';
import 'demoCode.dart';
import 'futureProvider_study.dart';
import 'provider_study.dart';

class ProviderStudyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Study List"),
      ),
      body: ListView(children: [
        ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("Provider Study Sample"),
            subtitle: Text("Provider Study"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProviderPage()));
            }),
        ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("ChangeNotifierProvider"),
            subtitle: Text("ChangeNotifierProvider的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangeNotifierProviderStudy()));
            }),
        ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Future Provider"),
            subtitle: Text("Future Provider 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => FluterProviderStudy()));
            }),
        ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Demo Provider"),
            subtitle: Text("Demo Provider 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DemoProviderStudy()));
            }),
      ]),
    );
  }
}
