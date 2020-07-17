import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///如果要提供两个Model，但是其中一个Model取决于另一个Model，在这种情况下，可以使用ProxyProvider。A ProxyProvider从一个Provider获取值，然后将其注入另一个Provider,
///ProxyProvider能够将不同provider中的多个值整合成一个对象，并将其发送给外层provider，当所依赖的多个provider中的任意一个发生变化时，这个新的对象都会更新
///https://dev.to/paulhalliday/how-to-use-proxyprovider-with-flutter-3ifo
class ProxyProviderStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PicModel>(create: (context) => PicModel()),
        ProxyProvider<PicModel, SubmitModel>(
          update: (context, picModel, submitModel) => SubmitModel(picModel),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                PicModel modol = Provider.of<PicModel>(context);
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: Text('提交图片：${modol.counter}'));
              },
            ),
            Builder(
              builder: (context) {
                SubmitModel modol = Provider.of<SubmitModel>(context);
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: Text('提交图片：${modol.modelTest}'));
              },
            ),
            Consumer<PicModel>(
              builder: (context, model, child) {
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.upLoadPic,
                    child: Text("changeprovider提交图片"));
              },
            ),
            Consumer<SubmitModel>(
              builder: (context, model, child) {
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.subMit,
                    child: Text("Proxy提交"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PicModel with ChangeNotifier {
  int counter = 0;

  Future<void> upLoadPic() async {
    await Future.delayed(Duration(seconds: 2));
    counter++;
    notifyListeners();
    print(counter);
  }
}

class SubmitModel {
  PicModel _model;

  SubmitModel(this._model);
  String get modelTest => "${_model.counter}";
  Future<void> subMit() async {
    await _model.upLoadPic();
  }
}
