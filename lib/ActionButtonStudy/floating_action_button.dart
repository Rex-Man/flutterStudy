import 'package:flutter/material.dart';

class FloatingActionButtonStudy extends StatelessWidget {
  // This widget is the root of your application.
  final String title;
  FloatingActionButtonStudy({this.title = "floating Action Study"});
  @override
  Widget build(BuildContext context) {
    return _FloatingActionButtonStudyPage(this.title);
  }
}

class _FloatingActionButtonStudyPage extends StatefulWidget {
  final String title;
  _FloatingActionButtonStudyPage(this.title);
  @override
  State<StatefulWidget> createState() =>
      _FloatingActionButtonStudyPageState(this.title);
}

class _FloatingActionButtonStudyPageState
    extends State<_FloatingActionButtonStudyPage> {
  String title;
  int _currentIndex = 0;
  List<Widget> tabChild = [_HomePage(), _CategoryPage(), _SettingPage()];
  _FloatingActionButtonStudyPageState(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(40),
          color:Colors.white
        ),
        child: FloatingActionButton(
          backgroundColor:this._currentIndex==1?Colors.red[50]: Colors.yellow,          
          child: Icon(Icons.add),
          onPressed: () {
             setState(() {
              this._currentIndex=1;
            }); 
          }
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabChild[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              this._currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Category")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text("Settings")),
          ]),
    );
  }
}

//这里定义的是主页面
class _HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Home Page"),
      ),
    );
  }
}

//这里定义的是分类页面
class _CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Category Page"),
      ),
    );
  }
}

//这里定义的是setting 页面
class _SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Setting Page"),
      ),
    );
  }
}
