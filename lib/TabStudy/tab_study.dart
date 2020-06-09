import 'package:flutter/material.dart';

//void main() => runApp(TabStudy());

class TabStudy extends StatelessWidget {
  // This widget is the root of your application.
   final String title;
  TabStudy({this.title="Tab Study"});
  @override
  Widget build(BuildContext context) {
    return  _MyHomePage(this.title);
  }
}

class _MyHomePage extends StatefulWidget{
   final String title;
  _MyHomePage(this.title);
  @override
  State<StatefulWidget> createState() =>_MyHomePageState(this.title);
  
}

class _MyHomePageState extends State<_MyHomePage>{
  String title;
  int _currentIndex=0;
  List<Widget> tabChild=[
    _HomePage(),
    _CategoryPage(),
    _SettingPage()
  ]; 
  _MyHomePageState(this.title);
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title:Text(this.title),
        ),
        body: tabChild[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex:_currentIndex,
          onTap:(index){
                 setState(() {
                  this._currentIndex = index;
                });
          },
          type: BottomNavigationBarType.fixed,
          items:[
            BottomNavigationBarItem(
              icon:Icon(
                Icons.home
              ),
              title:Text("Home")
            ),
            BottomNavigationBarItem(
              icon:Icon(
                Icons.category
              ),
              title:Text("Category")
            ),
            BottomNavigationBarItem(
              icon:Icon(
                Icons.settings
              ),
              title:Text("Settings")
            ),
          ]
        ),
     );
  }
}
//这里定义的是主页面
class _HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment:Alignment.center,
        child: Text("Home Page"),
      ),
    );
  }
}
//这里定义的是分类页面
class _CategoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        alignment:Alignment.center,
        child: Text("Category Page"),
      ),
    );
  }
}
//这里定义的是setting 页面
class _SettingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
        alignment:Alignment.center,
        child: Text("Setting Page"),
      ),
    );
  }
}


