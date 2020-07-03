import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//radio 和 check 的属性基本相同

class CheckBoxStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckBoxStudyState();
}

class _CheckBoxStudyState extends State<CheckBoxStudy> {
  bool isCheck = false;
  bool ischeckboxListTile=false;
  bool _isFemale = true;
  bool _checkboxListChecked;
  int radioGroupValue = 2;
  int radioListGroupValue = 1;
  bool _isSwitch=false;
  bool _isSwitch2=false;
  bool _isSwitchlistTile=false;
  bool _isSwitchlistTile2=false;

  //FocusNode
  FocusNode _focusNode = new FocusNode();
  @override
  void initState() {
    super.initState();
    _checkboxListChecked = false;
    _focusNode.addListener(_focusNodeListener);
  }

  Future<Null> _focusNodeListener() async {
    if (_focusNode.hasFocus) {
      print('获取焦点');
    } else {
      print('失去焦点');
    }
  }

  //FocusNode
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("check box study"),
        ),
        body: Column(children: [
          Checkbox(
              value: isCheck,
              autofocus: true,
              focusNode: _focusNode,
              focusColor: Colors.yellow,
              checkColor: Colors.black, // 勾选中图标的颜色，对号以及null 对应的符号的颜色
              activeColor: Colors.purple, // 勾选中框的颜色
              tristate: true, //如果为 true，那么复选框的值可以是 true，false 或 null
              materialTapTargetSize:
                  MaterialTapTargetSize.padded, //配置tap目标的最小大小
              onChanged: (value) {
                setState(() {
                  isCheck = value;
                  Fluttertoast.showToast(
                      msg: "checkbox 的 值：$value",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.lightBlue,
                      textColor: Colors.white,
                      fontSize: 16.0);
                });
              }),
          SizedBox(
            width: 20,
          ),
          Row(children: <Widget>[
            Text("女"),
            Checkbox(
              value: _isFemale,
              onChanged: (isFemale) {
                setState(() {
                  _isFemale = isFemale;
                });
              },
            ),
          ]),
          SizedBox(
            width: 20,
          ),
          CheckboxListTile(
            //有标题的Checkbox
            value: _checkboxListChecked,
            onChanged: (isCheck) {
              Fluttertoast.showToast(msg: "选的$isCheck");
              setState(() {
                _checkboxListChecked = isCheck;
              });
            },
            title: Text(
              "标题",
              style: TextStyle(color: Colors.blueAccent),
            ),
            subtitle: Text("副标题"),
            isThreeLine: true, //这个属性是是否站用三行。算标题和副标题 为true 的时候一定要有subtitle。
            secondary: Text("secondary"),
            selected: this._checkboxListChecked, //选中了标题高亮
            dense: false,
          ),
          CheckboxListTile(
            //有标题的Checkbox
            value: ischeckboxListTile,
            onChanged: (isCheck) {
              Fluttertoast.showToast(msg: "选的$isCheck");
              setState(() {
                ischeckboxListTile = isCheck;
              });
            },
            activeColor: Colors.red,
            title: Text(
              "标题",
            ),
            subtitle: Text("副标题"),
            isThreeLine: true, //这个属性是是否站用三行。算标题和副标题 为true 的时候一定要有subtitle。
            secondary: Icon(Icons.grade), //第二标题
            dense: true, //标题和副标题的紧凑是否一致。 true 紧凑一些，字体小一些，false 字体大一点。
            controlAffinity:
                ListTileControlAffinity.trailing, //这个属性是是设置check box的位置，
          ),
          SizedBox(
            width: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("男："),
              Radio(
                value: 1,
                focusNode: _focusNode,
                groupValue: this.radioGroupValue,
                onChanged: (value) {
                  setState(() {
                    Fluttertoast.showToast(msg: "选的$value");
                    this.radioGroupValue = value;
                  });
                },
              ),
              SizedBox(width: 20),
              Text("女："),
              Radio(
                value: 2,
                activeColor: Colors.red,
                groupValue: this.radioGroupValue,
                onChanged: (value) {
                  setState(() {
                    Fluttertoast.showToast(msg: "选的$value");
                    this.radioGroupValue = value;
                  });
                },
              ),
            ],
          ),
          RadioListTile(
            value: 1,
            onChanged: (value) {
              setState(() {
                this.radioListGroupValue = value;
              });
            },
            groupValue: this.radioListGroupValue,
            title: Text("一级标题"),
            subtitle: Text("二级标题"),
            secondary: Icon(Icons.camera),
            selected: this.radioListGroupValue == 1,
          ),
          RadioListTile(
            value: 2,
            onChanged: (value) {
              setState(() {
                this.radioListGroupValue = value;
              });
            },
            groupValue: this.radioListGroupValue,
            title: Text("一级标题"),
            subtitle: Text("二级标题"),
            secondary: Icon(Icons.palette),
            selected: this.radioListGroupValue == 2,
          ),
          Switch(
            value: this._isSwitch,
            onChanged:(switchValue){
               Fluttertoast.showToast(msg: "选的$switchValue");
                setState(() {
                  _isSwitch=switchValue;
                });
            },
            activeColor:Colors.red,   //当 value 是 true 时按钮的背景颜色。也就是开的状态时的颜色
            activeTrackColor:Colors.orange, // 当 value 是 true 时 滑块的颜色
            inactiveThumbColor:Colors.blue, // 当 value 是 false 时 滑块的颜色。也就是开的状态时的颜色
            inactiveTrackColor:Colors.green, //当 value 是 false 时 滑道的颜色
            dragStartBehavior:DragStartBehavior.down,//确定处理拖动启动行为的方式
          ),
          SizedBox(width: 20),
          Switch(
            value: this._isSwitch2,
            onChanged:(switchValue){
               Fluttertoast.showToast(msg: "选的$switchValue");
                setState(() {
                  _isSwitch2=switchValue;
                });
            },
            activeColor:Colors.red,   //当 value 是 true 时按钮的背景颜色。也就是开的状态时的颜色
            activeThumbImage:AssetImage("assets/images/cat.png"),
            onActiveThumbImageError:(s,e){
                print("show ImageErrorListener issue $s exception: $e");
            },
            inactiveThumbImage:AssetImage("assets/images/rabit.png"),
            onInactiveThumbImageError:(value,e){                          //当图片不存在的时候会调用方法 value  是错误信息 e 是错误赞
               print("show onInactiveThumbImageError issue $value exception: $e");
            },
            dragStartBehavior:DragStartBehavior.down,//确定处理拖动启动行为的方式
            materialTapTargetSize:MaterialTapTargetSize.shrinkWrap
          ),
          SwitchListTile(
            value: this._isSwitchlistTile,
            onChanged: (value){
              setState(() {
                _isSwitchlistTile=value;
              });
            },
            secondary: Icon(
                Icons.add_alarm,
            ),
            title: new Text("主标题"),
            subtitle: new Text("标题副s"),
            dense: false,             ////标题和副标题的紧凑是否一致。 true 紧凑一些，字体小一些，false 字体大一点。
            activeColor:Colors.red,   //当 value 是 true 时按钮的背景颜色。也就是开的状态时的颜色
            activeTrackColor:Colors.orange, // 当 value 是 true 时 滑块的颜色
            inactiveThumbColor:Colors.blue, // 当 value 是 false 时 滑块的颜色。也就是开的状态时的颜色
            inactiveTrackColor:Colors.green, //当 value 是 false 时 滑道的颜色
            isThreeLine: true,               //这个属性是是否站用三行。算标题和副标题 为true 的时候一定要有subtitle。
          ), 
          SwitchListTile(
            value: this._isSwitchlistTile2,
            onChanged: (value){
              setState(() {
                _isSwitchlistTile2=value;
              });
            },
            secondary: Icon(
                Icons.add_alarm,
            ),
            title: new Text("主标题"),
            subtitle: new Text("标题副2"),
            dense: false,             ////标题和副标题的紧凑是否一致。 true 紧凑一些，字体小一些，false 字体大一点。
            activeColor:Colors.red,   //当 value 是 true 时按钮的背景颜色。也就是开的状态时的颜色
            activeThumbImage:AssetImage("assets/images/cat.png"),
            inactiveThumbImage:AssetImage("assets/images/rabit.png"),
            isThreeLine: false,               //这个属性是是否站用三行。算标题和副标题 为true 的时候一定要有subtitle。
            selected: true,                   
            contentPadding:EdgeInsets.all(5)  //这只是SwitchListTile 控件与周边的边距设置。
          )
        ]));
  }
}
