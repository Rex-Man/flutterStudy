import 'package:flutter/material.dart';

class SwiperListStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swiper Study"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.router),
              title: Text("Sample Swiper"),
              subtitle: Text("简单轮播图的例子"),
              trailing: new Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "/swiperSample");
              }),
          ListTile(
              leading: Icon(Icons.router),
              title: Text("Fraction Swiper"),
              subtitle: Text("Fraction轮播图的例子"),
              trailing: new Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "/fractionSample");
              }),
          ListTile(
              leading: Icon(Icons.bluetooth),
              title: Text("Custorm Swiper"),
              subtitle: Text("Custorm 轮播图的例子"),
              trailing: new Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "/swiperCustom");
              }),
          ListTile(
              leading: Icon(Icons.bluetooth),
              title: Text("phone Swiper"),
              subtitle: Text("Phone轮播图的例子"),
              trailing: new Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "/swiperPhone");
              }),
           ListTile(
              leading: Icon(Icons.wb_incandescent),
              title: Text("Demo Swiper"),
              subtitle: Text("Demo轮播图的例子"),
              trailing: new Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.pushNamed(context, "/myfirstSwiper");
              }),
        ],
      ),
    );
  }
}
