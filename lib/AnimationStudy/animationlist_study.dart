import 'package:flutter/material.dart';

import 'animatedbuilder_study.dart';
import 'animatedswitcher_study.dart';
import 'animationWidget_study.dart';
import 'animation_study.dart';
import 'customeranimationswitch_study.dart';
import 'searchdelegate.dart';
import 'staggeranimation_study.dart';

///AnimationWidget 和 AnimatedBuilder 的好处
///不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的。
///动画构建的范围缩小了，如果没有builder，setState()将会在父组件上下文中调用，这将会导致父组件的build方法重新调用；而有了builder之后，只会导致动画widget自身的build重新调用，避免不必要的rebuild。
class AnimationListStudy extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Study"),
      ),
      body: ListView(children: [
        ListTile(
            leading: Icon(Icons.router),
            title: Text("Sample Animation"),
            subtitle: Text("简单 Animation 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScaleAnimationStudy()));
            }),
        ListTile(
            leading: Icon(Icons.router),
            title: Text("AnimationWidget Animation"),
            subtitle: Text("AnimationWidget 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => ScaleAnimationWidgetStudy()));
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500), //动画时间为500毫秒
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                    return new FadeTransition(
                      //使用渐隐渐入过渡,
                      opacity: animation,
                      child: ScaleAnimationWidgetStudy(), //路由B
                    );
                  },
                ),
              );
            }),
        ListTile(
            leading: Icon(Icons.android),
            title: Text("AnimatedBuilder Case"),
            subtitle: Text("AnimatedBuilder 的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AnimatedBuilderStudy()));
            }),
        ListTile(
            leading: Icon(Icons.android),
            title: Text("Stagger Case"),
            subtitle: Text("交织动画的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => StaggerRoute()));
            }),
        ListTile(
            leading: Icon(Icons.android),
            title: Text("Animated Switcher Case"),
            subtitle: Text("动画切换的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AnimatedSwitcherCounterRoute()));
            }),
        ListTile(
            leading: Icon(Icons.android),
            title: Text("Custormer Animated Switcher Case"),
            subtitle: Text("动画切换的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CustomerAnimatedSwitcher()));
            }),
        ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("SearchDelegate Study"),
            subtitle: Text("SearchDelegate Study"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchBarDemo()));
            }),
      ]),
    );
  }
}
