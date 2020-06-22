import 'package:flutter/material.dart';
import 'package:flutterStudy/RouteStudy/named_route.dart';

import 'RouteStudy/named_on_generateroute.dart';
import 'RouteStudy/named_route_param.dart';
import 'RouteStudy/named_route_return.dart';
import 'RouteStudy/route_list.dart';
import 'TabStudy/tab_study.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Map routes={
    '/ongenerateroute':(context) => NamedOnGenerateRoute(),
    '/ongeneraterouteparam':(context,{arguments}) => NamedOnGenerateRouteParam(arguments:arguments)
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/namedroute':(context)=>NamedRoute(),
        '/namedrouteresult':(context)=> NamedRouteResult(),
        '/namedrouteparam':(context)=>NamedRouteParam(),
        '/namedrouteparamresult':(context)=>NamedRouteParamResult(),
        '/namedroutereturn':(context)=>NamedRouteReturn()
      },
      onGenerateRoute:(RouteSettings settings){
        final String name=settings.name;
        final Function pageContentBuilder = this.routes[name];
        if(pageContentBuilder !=null){
          if(settings.arguments !=null){
            final Route route =MaterialPageRoute(
              builder: (context)=>pageContentBuilder(context,arguments:settings.arguments)
            );
            return route;
          }else{
            final Route route=MaterialPageRoute(
              builder: (context) => pageContentBuilder(context)
            );
            return route;
          }
        }
      },
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
    TabStudy(),RouteStudy()
  ];

  // 数据源
  List<String> titleItems = <String>[
    'Tab Study','Route Study'
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.tab), Icon(Icons.router)
  ];

  List<String> subTitleItems = <String>[
    'subTitle: tab study','subTitile: route study'
  ];
  
