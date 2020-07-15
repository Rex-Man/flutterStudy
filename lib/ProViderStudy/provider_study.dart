import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/myModel.dart';

///https://www.jianshu.com/p/9cd4b9fb7b44
///https://www.lizenghai.com/archives/36668.html
class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                // 获取到provider提供出来的值  先使用Provider.of<MyModel>(context)获取到MyModel对象的引用
                MyModel _model = Provider.of<MyModel>(context);
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: Text('当前是：${_model.counter}'));
              },
            ),
            Consumer<MyModel>(
              // 获取到provider提供出来的值
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
            Consumer<MyModel>(
              // 获取到provider提供出来的值
              builder: (context, model, child) {
                return FlatButton(
                    //点击FlatButton，model调用incrementCounter()函数，计数值加1。但是并不会重建UI，因为该Provider小部件不会监听其提供的值的更改。
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
}
