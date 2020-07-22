import 'package:flutter/material.dart';

///因为animation switch 是新旧child 执行想法的操作，如果，在执行退出旧child的时候不过不想执行相反的操作，可以用下面的方法。
class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    //动画反向执行时，调整x偏移，实现“从左边滑出隐藏”
    if (position.status == AnimationStatus.reverse) {
      //这里是重点，捕获反向动画的状态，然后执行需要的动画。
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

class CustomerAnimatedSwitcher extends StatefulWidget {
  const CustomerAnimatedSwitcher({Key key}) : super(key: key);

  @override
  _CustomerAnimatedSwitcherState createState() =>
      _CustomerAnimatedSwitcherState();
}

class _CustomerAnimatedSwitcherState extends State<CustomerAnimatedSwitcher> {
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
                duration: Duration(milliseconds: 200),
                child: Text(
                  '$_count',
                  //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
                  key: ValueKey<int>(_count),
                  style: Theme.of(context).textTheme.headline4,
                ),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  var tween =
                      Tween<Offset>(begin: Offset(0, 0), end: Offset(1, 0));
                  return MySlideTransition(
                    child: child,
                    position: tween.animate(animation),
                  );
                }),
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
