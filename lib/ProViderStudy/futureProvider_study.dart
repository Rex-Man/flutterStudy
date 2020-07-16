///我们需要给它提供一些显示在UI中的初始数据，还要为它设置要提供值的Future。
///在Future完成的时候，FutureProvider会通知Consumer重建自己的小部件
///FutureProvider适用于没有刷新和变更的页面，和FutureBuilder一样的作用

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
