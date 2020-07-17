///我们需要给它提供一些显示在UI中的初始数据，还要为它设置要提供值的Future。
///在Future完成的时候，FutureProvider会通知Consumer重建自己的小部件
///FutureProvider适用于没有刷新和变更的页面，和FutureBuilder一样的作用
///我们先看 floatingActionButton，使用了一个 Consumer 的情况。

///Coosumer 的学习
///Consumer 使用了 Builder模式，收到更新通知就会通过 builder 重新构建。Consumer<T> 代表了它要获取哪一个祖先中的 Model。
///Consumer 的 builder 实际上就是一个 Function，它接收三个参数 (BuildContext context, T model, Widget child)。
///context： context 就是 build 方法传进来的 BuildContext 。
///T：T也很简单，就是获取到的最近一个祖先节点中的数据模型。
///child：它用来构建那些与 Model 无关的部分，在多次运行 builder 中，child 不会进行重建。
///然后它会返回一个通过这三个参数映射的 Widget 用于构建自身。
///在这个浮动按钮的例子中，我们通过 Consumer 获取到了顶层的 CounterModel 实例。并在浮动按钮 onTap 的 callback 中调用其 increment 方法。
///而且我们成功抽离出 Consumer 中不变的部分，也就是浮动按钮中心的 Icon 并将其作为 child 参数传入 builder 方法中。
///还有 Consumer2， Consumer3，Consumer4，……
///实际上 Consumer 非常有用，它的经典之处在于能够在复杂项目中，极大地缩小你的控件刷新范围
///原文链接：https://blog.csdn.net/lpfasd123/article/details/101573980

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'Model/changeNotifierModel.dart';

class FluterProviderStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      initialData: ChangeNotifierModel(counter: 0),
      create: (context) => someAsyncFunctionToGetMyModel(),

      ///新的create/ update回调是延迟加载的，这意味着它们在第一次读取值时被调用，而不是在第一次创建提供程序时被调用。
      ///如果这是不希望的，则可以通过传递lazy: false给您选择的提供程序来禁用延迟加载
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                ChangeNotifierModel _model =
                    Provider.of<ChangeNotifierModel>(context, listen: true);
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: Text('当前是：${_model.counter}'));
              },
            ),
            Consumer<ChangeNotifierModel>(
              builder: (context, model, child) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  color: Colors.lightGreen,
                  child: Text(
                    '${model.counter}',
                  ),
                );
              },
            ),
            Consumer<ChangeNotifierModel>(
              builder: (context, model, child) {
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.incrementCounter,
                    child: Icon(Icons.add));
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<ChangeNotifierModel> someAsyncFunctionToGetMyModel() async {
    //  <--- async function
    await Future.delayed(Duration(seconds: 3));
    return ChangeNotifierModel(counter: 1);
  }
}
