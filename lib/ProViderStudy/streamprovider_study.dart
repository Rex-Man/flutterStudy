///StreamProvider基本上是StreamBuilder的包装
///StreamProvider也不会监听model本身的变化。它仅监听流中的新事件
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/changeNotifierModel.dart';

class StreamProviderStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      initialData: ChangeNotifierModel(counter: 0),
      create: (context) => getStreamOfMyModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                ChangeNotifierModel _model = Provider.of<ChangeNotifierModel>(context, listen: false);
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

  Stream<ChangeNotifierModel> getStreamOfMyModel() {
    return Stream<ChangeNotifierModel>.periodic(
        Duration(seconds: 1), (x) => ChangeNotifierModel(counter: x)).take(10);
  }
}
