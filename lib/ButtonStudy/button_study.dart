import 'package:flutter/material.dart';

///
///RaisedButton 与 FlatButton,OutlineButton 基本上是一样的。
class ButtonStudy extends StatelessWidget {
  Key buttonkey;
  ButtonStudy({this.buttonkey});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮学习"),
        actions: <Widget>[
          IconButton(
            key: buttonkey,
            onPressed: () {
              print("Icon Button");
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.black, size: 40),
        backgroundColor: Colors.yellow,
      ),
      body: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
              child: Text('普通按钮'),
              onPressed: () {
                print("普通按钮");
              }),
          SizedBox(
            width: 10,
          ),
          RaisedButton(
              child: Text('有颜色按钮'),
              color: Colors.blue, //按钮的颜色
              textColor: Colors.white, //文字颜色
              highlightColor: Colors.deepPurpleAccent, //按钮的水波纹亮起的颜色
              splashColor: Colors.deepOrangeAccent, //水波纹的颜色
              colorBrightness: Brightness.dark, //按钮主题高亮
              elevation: 50.0, //按钮下面的阴影长度
              highlightElevation: 100.0, //按钮高亮时的下面的阴影长度
              disabledElevation: 20.0,
              onPressed: () {
                print("有颜色按钮");
              }),
          SizedBox(
            width: 10,
          ),
          Container(
            //如果需要修改按钮的宽度和高度，就将按钮包在Container 下面
            width: 100,
            height: 100,
            child: RaisedButton(
                child: Text('圆形按钮'),
                onPressed: () {
                  print("圆形按钮");
                },
                color: Colors.red,
                shape:
                    CircleBorder(side: BorderSide(color: Colors.yellow[500]))),
          ),
          SizedBox(
            width: 10,
          ),
        ]),
        Row(
          children: <Widget>[
            RaisedButton.icon(
                onPressed: () {
                  print("带图标的按钮");
                },
                icon: Icon(Icons.account_box),
                label: Text("带图标的按钮")),
            SizedBox(
              width: 10,
            ),
            RaisedButton(
              child: Text("圆角按钮"),
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {},
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: RaisedButton(
                  child: Text('自适应button'),
                  onPressed: () {
                    print("自适应button");
                  }),
            )
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
                color: Colors.green,
                onPressed: () {
                  print("Flat Button");
                },
                child: Text("Flat Button")),
            SizedBox(
              width: 10,
            ),
            OutlineButton(
              onPressed: () {
                print("OutlineButton");
              },
              child: Text("边线按钮"),
              textColor: Colors.red,
              splashColor: Colors.green,
              highlightColor: Colors.black,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: Icon(Icons.accessible),
                onPressed: () {
                  print("IconButton");
                })
          ],
        )
      ]),
    );
  }
}
