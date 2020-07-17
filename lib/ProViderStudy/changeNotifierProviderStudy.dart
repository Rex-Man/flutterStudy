import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/changeNotifierModel.dart';

///ChangeNotifierProvider 会在你需要的时候，自动调用其 _disposer 方法。
///能够对子节点提供一个 继承 / 混入 / 实现 了 ChangeNotifier 的类。通常我们只需要在 Model 中 with ChangeNotifier ，然后在需要刷新状态的时候调用 notifyListeners 即可。
class ChangeNotifierProviderStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //ChangeNotifierProvider会监听其提供出去的模型对象中的更改。当有值更改后，它将重建下方所有的Consumer和使用Provider.of<MyModel>(context)监听并获取提供值的地方。
      create: (_) => ChangeNotifierModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('change notifier provider'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                ChangeNotifierModel _model = Provider.of<ChangeNotifierModel>(
                    context,
                    listen:
                        true); //把Provider.of的监听器设置为false，这样更改后就不会重新构建第一行的text

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
}
