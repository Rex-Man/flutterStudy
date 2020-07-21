import 'package:flutter/material.dart';

///https://www.jianshu.com/p/d1c6a5ef4fa4
///在动画的每一帧中，我们可以通过Animation对象的value属性获取动画的当前状态值。
///Animation是一个抽象类，它本身和UI渲染没有任何关系，而它主要的功能是保存动画的插值和状态
///Animation对象知道动画的当前状态（例如，它是开始、停止还是向前或向后移动），但它不知道屏幕上显示的内容
///Animation来监听动画每一帧以及执行状态的变化
///            addListener();它可以用于给Animation添加帧监听器，在每一帧都会被调用
///            addStatusListener()；它可以给Animation添加“动画状态改变”监听器；动画开始、结束、正向或反向（见AnimationStatus定义）时会调用状态改变的监听器。
///
class ScaleAnimationStudy extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationStudy>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  ///AnimationController用于控制动画AnimationController会在动画的每一帧，就会生成一个新的值。默认情况下，AnimationController在给定的时间段内线性的生成从0.0到1.0（默认区间）的数字。

  initState() {
    super.initState();
    //需要传递一个vsync参数，存在vsync时会防止屏幕外动画（译者语：动画的UI不在当前屏幕时）消耗不必要的资源。 通过将SingleTickerProviderStateMixin添加到类定义中，可以将stateful对象作为vsync的值
    //vsync对象会绑定动画的定时器到一个可视的widget，所以当widget不显示时，动画定时器将会暂停，当widget再次显示时，动画定时器重新恢复执行，这样就可以避免动画相关UI不在当前屏幕时消耗资源。 如果要使用自定义的State对象作为vsync时，请包含TickerProviderStateMixin
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInCirc);

    //Tween是一个无状态(stateless)对象，需要begin和end值。Tween的唯一职责就是定义从输入范围到输出范围的映射
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0)
        .animate(animation) //要使用Tween对象，请调用其animate()方法，传入一个控制器对象。
          ..addListener(() {
            //这总方式一定要加
            setState(() => {});
          });

    // controller = new AnimationController(
    //     duration: const Duration(seconds: 3), vsync: this);

    // //图片宽高从0变到300
    // animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
    //   ..addListener(() {
    //     setState(() => {});
    //   });

    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print("call Father in animation ");
    return Scaffold(
      appBar: AppBar(
        title: Text("缩放简单动画"),
      ),
      body: Center(
        child: Image.asset("assets/images/tou8.jpg",
            width: animation.value, height: animation.value),
      ),
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
