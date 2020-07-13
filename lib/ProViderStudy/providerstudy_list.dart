import 'package:flutter/material.dart';

import 'changeNotifierProviderStudy.dart';
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
            title: Text("ChangeNotifierProvider Other"),
            subtitle: Text("ChangeNotifierProvider的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangeNotifierProviderStudy()));
            }),
        // ListTile(
        //     leading: Icon(Icons.access_alarms),
        //     title: Text("Webview MyHomePage"),
        //     subtitle: Text("简单webview的例子"),
        //     trailing: new Icon(Icons.keyboard_arrow_right),
        //     onTap: () {
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) => MyHomePage()));
        //     }),
      ]),
    );
  }
}
