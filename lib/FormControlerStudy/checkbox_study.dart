import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckBoxStudy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CheckBoxStudyState();

}

class _CheckBoxStudyState extends State<CheckBoxStudy>{
  bool isCheck=false;
  @override
  Widget build(BuildContext context) {
     return  Scaffold(
             appBar: AppBar(
               title: Text("check box study"),
             ), 
             body: Column(
                children: [
                  Checkbox(
                        value: isCheck, 
                        focusColor: Colors.yellow,
                        checkColor: Colors.black,             // 勾选中图标的颜色，对号以及null 对应的符号的颜色
                        activeColor:Colors.purple,            // 勾选中框的颜色
                        tristate:true,                        //如果为 true，那么复选框的值可以是 true，false 或 null
                        onChanged: (value){
                          setState(() {
                            isCheck=value;
                            Fluttertoast.showToast(
                              msg: "checkbox 的 值：$value",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.lightBlue,
                              textColor: Colors.white,
                              fontSize: 16.0
                            );
                          });
                        }
                       )
                ],
             ),
     );
  }
}
