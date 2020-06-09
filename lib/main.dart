import 'package:flutter/material.dart';

import 'tab_study_main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          title:Text("Study List For Flutter")
        ),
        body: Scrollbar(
          child: ListView.separated(
            itemBuilder: (context, item) {
              return buildListData(context, titleItems[item], iconItems[item], subTitleItems[item],widgets[item]);
            },
            separatorBuilder: (BuildContext context, int index) => new Divider(),
            itemCount: iconItems.length
          ),
        ),
     );
  }

}

 Widget buildListData(BuildContext context, String titleItem, Icon iconItem, String subTitleItem,Widget widgetItem) {
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(
        subTitleItem,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
                      builder:(context)=>widgetItem
                )
        );
      },

    );
  }
  List<Widget> widgets=<Widget>[
    TabStudy()
  ];

  // 数据源
  List<String> titleItems = <String>[
    'Tab Study'
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.tab), 
  ];

  List<String> subTitleItems = <String>[
    'subTitle: tab study'
  ];
  
