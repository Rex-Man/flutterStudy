import 'package:flutter/material.dart';

import 'tab_bike.dart';
///
/// 此部分主要是顶部tab 的操作。
/// 首先 DefaultTabController 此类是必须添加的
/// 完善必填的参数 length 
/// 其次是下面bottom 或者 title 中添加TabBar 数量要与 DefaultTabController length 对应上
/// bottom: TabBar(
///              tabs: <Widget>[
///                Tab(icon:Icon(Icons.directions_car)),
///                Tab(icon:Icon(Icons.directions_bike)),
///                Tab(icon:Icon(Icons.directions_transit)),
///              ],
///            ),
/// 然后在body 中添加 TabBarView 类 添加与length 对应个数的child
class AppBarStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(      // 1
        length: 3,
        child: Scaffold(
          appBar: AppBar( 
            backgroundColor: Colors.green,
            title: Text("AppBarDemo"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('Search Button Click');
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  print('Settings Button Click');
                },
              ),
              IconButton(
                icon: Icon(Icons.shuffle),
                onPressed: () {
                  print('shuffle Button Click');
                },
              )
            ],
            bottom: TabBar(                                   // 2
              indicatorColor: Colors.red, 
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.white,
              isScrollable: true, //用来说明如果tab 比较多的时候，可以划动，
              indicatorSize: TabBarIndicatorSize.label,// 设置选中后指示线的长度
              tabs: <Widget>[
                Tab(icon:Icon(Icons.directions_car)),
                Tab(icon:Icon(Icons.directions_bike)),
                Tab(icon:Icon(Icons.directions_transit)),
              ],
            ),
          ),
          body: TabBarView(                                  // 3
            children:<Widget>[
                ListView(
                  children:[
                    ListTile(title:Text('This is first item 1 table')),
                    ListTile(title:Text('This is first items 2 table')),
                  ]
                ),
                Container(
                  child: TabBike(),//TabCar对应tab_bike.dart的Class name
                ),
                Text("This is the Third page"),
               
            ]
          ),
        ));
  }
}
