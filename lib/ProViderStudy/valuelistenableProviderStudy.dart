import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/valueNotifierModel.dart';

///ValueListenableProvider类似于ValueChange的封装,
///它的作用和ChangeNotifierProvider一样，在值改变的时候，
///会通知Consumer重新build，但是使用起来比ChangeNotifierProvider复杂，
///需要先用Provider提供MyModel给Consumer，
///然后把MyModel里的ValueNotifier给ValueListenableProvider
///它实际上是专门用于处理只有一个单一变化数据的 ChangeNotifier。
///通过 ValueListenable 处理的类不再需要数据更新的时候调用 notifyListeners
/////https://www.jianshu.com/p/945c7ad4c058

class ValueListenableProviderStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ValueNotifierModel>(
      create: (context) => ValueNotifierModel(),
      child: Consumer<ValueNotifierModel>(builder: (context, myModel, child) {
        return ValueListenableProvider<int>.value(
          value: myModel.counter,
          child: Scaffold(
            appBar: AppBar(
              title: Text('provider'),
            ),
            body: Column(
              children: <Widget>[
                Builder(
                  builder: (context) {
                    var count = Provider.of<int>(context);
                    return Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(20),
                        alignment: Alignment.center,
                        color: Colors.lightBlueAccent,
                        child: Text('当前是：$count'));
                  },
                ),
                Consumer<int>(
                  builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      color: Colors.lightGreen,
                      child: Text(
                        '$value',
                      ),
                    );
                  },
                ),
                Consumer<ValueNotifierModel>(
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
      }),
    );
  }
}
