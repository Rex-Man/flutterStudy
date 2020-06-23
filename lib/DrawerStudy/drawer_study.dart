import 'package:flutter/material.dart';

class DrawerStudy extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
           title: Text("Drawer Study")
        ),
        body: Container(
          child: Text("data"),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image:AssetImage(
                          "assets/images/drawerhead.jpeg",
                        ),
                    fit:BoxFit.cover    
                    ),
                ),
                child: Center(
                  child: SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: CircleAvatar(
                      child: Text('R'),
                    ),
                  ),
                ),
              ),
              Divider(),                    //添加横线
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.home),
                ),
                title: Text('我的空间'),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.bluetooth),
                ),
                title: Text('我的蓝牙'),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.settings),
                ),
                title: Text('我的设置'),
              ),
              Divider()
            ],
          ),
        ),
        endDrawer: Drawer(
          child: Column(
            children: <Widget>[
              Expanded(
                   child: UserAccountsDrawerHeader(
                        accountName: Text('Rex Man'), 
                        accountEmail: Text('rex.man@oocl.com'),
                        currentAccountPicture:CircleAvatar(
                          backgroundImage:AssetImage(
                              "assets/images/head.jpg",
                            ) ,
                        ), 
                        decoration: BoxDecoration(
                          image:DecorationImage(
                            image:AssetImage(
                                  "assets/images/drawerhead.jpeg",
                                ),
                            fit:BoxFit.cover    
                            ),
                        ),
                     )
                ),
                Divider(),                    //添加横线
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.home),
                  ),
                  title: Text('我的空间'),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.bluetooth),
                  ),
                  title: Text('我的蓝牙'),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.settings),
                  ),
                  title: Text('我的设置'),
                ),
                Divider()
            ],
          )
        ),
      );
  }
  
}