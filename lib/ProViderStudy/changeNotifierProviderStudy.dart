import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/changeNotifierModel.dart';

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
                ChangeNotifierModel _model =
                    Provider.of<ChangeNotifierModel>(context);
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
