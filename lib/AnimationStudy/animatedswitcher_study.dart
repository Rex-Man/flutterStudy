/// 实际开发中，我们经常会遇到切换UI元素的场景Flutter SDK中提供了一个AnimatedSwitcher组件，它定义了一种通用的UI切换抽象
/// 当AnimatedSwitcher的child发生变化时（类型或Key不同），旧child会执行隐藏动画，新child会执行执行显示动画。
/// 执行何种动画效果则由transitionBuilder参数决定
/// 该builder在AnimatedSwitcher的child切换时会分别对新、旧child绑定动画：
///            对旧child，绑定的动画会反向执行（reverse）
///            对新child，绑定的动画会正向指向（forward）
///            这样一下，便实现了对新、旧child的动画绑定
import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSwitcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行缩放动画
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count',
                //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            RaisedButton(
              child: const Text(
                '+1',
              ),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
