import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model/bannerModel.dart';
import 'Model/listModel.dart';

class MultiProviderStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BannerModel>(create: (context) => BannerModel()),
        ChangeNotifierProvider<ListModel>(create: (context) => ListModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Column(
          children: <Widget>[
            Builder(
              builder: (context) {
                BannerModel modol = Provider.of<BannerModel>(context);
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    color: Colors.lightBlueAccent,
                    child: Text('当前Banner有几个：${modol.counter}'));
              },
            ),
            Consumer<ListModel>(
              builder: (context, model, child) {
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  color: Colors.lightGreen,
                  child: Text(
                    '当前List有几个：${model.counter}',
                  ),
                );
              },
            ),
            Consumer<BannerModel>(
              builder: (context, model, child) {
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.getBanner,
                    child: Text("获取banner"));
              },
            ),
            Consumer<ListModel>(
              builder: (context, model, child) {
                return FlatButton(
                    color: Colors.tealAccent,
                    onPressed: model.getList,
                    child: Text("获取列表"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
