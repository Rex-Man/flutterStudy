import 'package:flutter/material.dart';


///
///使用TabControl 方法需要注意的事项
/// 1. 类必须继承StatefulWidget
/// 2. state类必须实现SingleTickerProviderStateMixin
/// 3. 在initState 的方法中需要初始化TabController
/// 4. 在TabBar组件中指定controller为我们实例化的TabController
/// 5. 在TabBarView组件中指定controller为我们实例化的TabController
/// 
class TabControlerStudy extends StatefulWidget{  // 1
  @override
  _TabControlerStudyState createState() =>_TabControlerStudyState();

}
class _TabControlerStudyState extends State<TabControlerStudy> with SingleTickerProviderStateMixin{  //2
  TabController tabController;
  @override
  void dispose(){ //生命周期函数：
    super.dispose();
    tabController.dispose();
  }
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);  //3
    tabController.addListener((){
      var index = tabController.index;
      var previousIndex = tabController.previousIndex;
      print("index: $index");
      print('previousIndex: $previousIndex');
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("This Demo is use TabController"),
         bottom: TabBar(                        
          controller:this.tabController,        //4
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.directions_car),
              text: "汽车",
            ),
            Tab(
              icon: Icon(Icons.directions_bike),
              text: "自行车",
            ),
            Tab(
              icon: Icon(Icons.directions_boat),
              text: '轮船',
            ),
          ],
         ),
       ),
       body: TabBarView(
        controller: this.tabController,       //5
        children: <Widget>[
          Center(child: Text('汽车')),
          Center(child: Text('自行车')),
          Center(child: Text('轮船'))
        ]
      ),
    );
  }
  
}

