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
        ],
      ),
    );
  }
}
