import 'package:flutter/material.dart';
//https://www.codercto.com/a/34161.html
//https://www.cnblogs.com/sundaysme/p/12701385.html
//http://laomengit.com/flutter/widgets/SliverAnimatedList.html
//https://www.bilibili.com/video/av70529375/
//https://www.jianshu.com/p/678509dccd31
class SliverStudyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliver Study List"),
      ),
      body: ListView(children: [
        ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("Sliver Study Sample"),
            subtitle: Text("Sliver Study"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  //MaterialPageRoute(builder: (context) => ProviderPage()));
            }),
      ]),
    );
  }
}