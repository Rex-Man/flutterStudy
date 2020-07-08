import 'package:flutter/material.dart';

class DialogStudyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Title(
              color: Colors.red,
              child: Container(
                child: Text("Dialog Study"),
              )),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AlertDialogStudy(),
            SampleDialogStudy(),
            AboutDialogStudy(),
            MyDialogStudy(),
            ShowGeneralDialogStudy(),
            ShowModalBottomSheetStudy()
          ],
        ));
  }
}

class AlertDialogStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () async {
        var turnvluereturnvlue = await showDialog(
          context: context,
          barrierDismissible: true, //点击dialog之外是否关闭dialog
          builder: (context) {
            return AlertDialog(
              title: Text("提示"),
              content: Text("确定要删除吗"),
              actions: <Widget>[
                FlatButton(
                    child: Text("取消"),
                    onPressed: () => Navigator.pop(context, "cancel")),
                FlatButton(
                    child: Text("确定"),
                    onPressed: () => Navigator.pop(context, "yes")),
              ],
            );
          },
        );
        print("value ---------------- $turnvluereturnvlue");
      },
      child: Text("Alert Dialog"),
      textColor: Colors.red,
      splashColor: Colors.green,
      highlightColor: Colors.blue,
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class SampleDialogStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true, //点击dialog之外是否关闭dialog
          builder: (context) {
            return SimpleDialog(
              title: Text("Simple Dialog"),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('Option A'),
                  onPressed: () {
                    Navigator.of(context).pop('Option A');
                  },
                ),
                SimpleDialogOption(
                  child: Text('Option B'),
                  onPressed: () {
                    Navigator.of(context).pop('Option B');
                  },
                ),
                SimpleDialogOption(
                  child: Text('Option C'),
                  onPressed: () {
                    Navigator.of(context).pop('Option C');
                  },
                ),
              ],
            );
          },
        );
      },
      child: Text("Simple Dialog"),
      textColor: Colors.red,
      splashColor: Colors.green,
      highlightColor: Colors.blue,
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class AboutDialogStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true, //点击dialog之外是否关闭dialog
          builder: (context) {
            return AboutDialog(
              applicationName: '名称',
              applicationIcon: new Icon(Icons.ac_unit),
              applicationVersion: 'V1.0',
              applicationLegalese: 'Legalese',
              children: <Widget>[new Text("关于我们")],
            );
          },
        );
      },
      child: Text("About Dialog"),
      textColor: Colors.red,
      splashColor: Colors.green,
      highlightColor: Colors.blue,
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

///自定义Dialog Study
class MyDialog extends Dialog {
  final String title;
  final String content;
  MyDialog({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: 200,
            width: 200,
            color: Colors.white,
            child: Column(children: <Widget>[
              Text("$title", style: TextStyle(fontSize: 18.0)),
              Text("$content", style: TextStyle(fontSize: 12.0))
            ])));
  }
}

class MyDialogStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true, //点击dialog之外是否关闭dialog
          builder: (context) {
            return MyDialog(title: 'title', content: 'contend');
          },
        );
      },
      child: Text("My Dialog"),
      textColor: Colors.red,
      splashColor: Colors.green,
      highlightColor: Colors.blue,
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

///
class ShowGeneralDialogStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        showGeneralDialog(
            context: context,
            pageBuilder: (context, anim1, anim2) {
              //这里是第一选择显示的内容
              return Text("dfsdfsdfsdfsd");
            },
            barrierColor: Colors.grey.withOpacity(.4), //背景颜色
            barrierDismissible: true, //是否可以点击背景关闭
            barrierLabel: "",
            transitionDuration: Duration(milliseconds: 400), //这个是从开始到完全显示的时间
            transitionBuilder: (context, anim1, anim2, child) {
              //这里的transitionBuuilder 如果不return child 的话是回覆盖pageBuilder里面的
              return Transform.rotate(
                  angle: 1.0,
                  child: Opacity(
                    opacity: anim1.value,
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      title: Text("Dialog"),
                      content: Text("Hello world"),
                    ),
                  ));
            });
      },
      child: Text("ShowGeneral Dialog"),
      textColor: Colors.red,
      splashColor: Colors.green,
      highlightColor: Colors.blue,
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ShowModalBottomSheetStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 200,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("设置"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("主页"),
                      onTap: () => Navigator.pop(context),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text("信息"),
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            });
      },
      child: Text("Modal Bottom Sheet Dialog"),
      textColor: Colors.red,
      splashColor: Colors.green,
      highlightColor: Colors.blue,
      shape: BeveledRectangleBorder(
        side: BorderSide(
          color: Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
