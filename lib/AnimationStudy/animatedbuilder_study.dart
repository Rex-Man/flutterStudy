import 'package:flutter/material.dart';

class AnimatedBuilderStudy extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<AnimatedBuilderStudy>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  initState() {
    super.initState();

    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOutQuad);

    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        //print("test if it will be call"); //这个可以被调用。
      });
    //我们可以通过Animation的addStatusListener()方法来添加动画状态改变监听器
    //有四种状态 dismissed 动画在起始点停止    forward  动画正在正向执行    reverse   动画正在反向执行   completed  动画在终点停止
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print("call Father in animation builder widget");
    return Scaffold(
        appBar: AppBar(
          title: Text("缩放简单动画"),
        ),
        body: AnimatedBuilder(
          animation: animation,
          child: Image.asset("assets/images/xinxing.png"),
          builder: (BuildContext ctx, Widget child) {
            return Center(
              child: Container(
                height: animation.value,
                width: animation.value,
                child: child,
              ),
            );
          },
        ));
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
