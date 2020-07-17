import 'package:flutter/material.dart';
import 'package:flutterStudy/ProViderStudy/streamProvider_Study.dart';

import 'changeNotifierProviderStudy.dart';
import 'demoCode.dart';
import 'futureProvider_study.dart';
import 'multiprovider_study.dart';
import 'provider_study.dart';
import 'proxyprovider_study.dart';
import 'valuelistenableProviderStudy.dart';

/// https://www.jianshu.com/p/9cd4b9fb7b44
/// https://blog.csdn.net/lpfasd123/article/details/101573980
/// https://www.jianshu.com/p/efe25e4e0467
/// //https://www.jianshu.com/p/31499233c673
/// //https://www.lizenghai.com/archives/111840.html
/// 不要在只会调用一次的组件生命周期中调用Provide
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FluterProviderStudy()));
            }),
        ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Demo Provider"),
            subtitle: Text("Demo Provider 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DemoProviderStudy()));
            }),
        ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Stream Provider"),
            subtitle: Text("Stream Provider 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StreamProviderStudy()));
            }),
        ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("ValueListenable Provider"),
            subtitle: Text("ValueListenable Provider 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ValueListenableProviderStudy()));
            }),
        ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("MultiProvider Provider"),
            subtitle: Text("MultiProvider Provider 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MultiProviderStudy()));
            }),
        ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("ProxyProvider Provider"),
            subtitle: Text("ProxyProvider Provider 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProxyProviderStudy()));
            }),
      ]),
    );
  }
}
