

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutterStudy/FormControlerStudy/cupertino_date_picker/datetime_picker_bottom_sheet.dart';
import 'package:flutterStudy/FormControlerStudy/cupertino_date_picker/time_picker_in_page.dart';

import 'cupertino_date_picker/date_picker_bottom_sheet.dart';
import 'cupertino_date_picker/date_picker_in_page.dart';
import 'cupertino_date_picker/datetime_picker_in_page.dart';
import 'cupertino_date_picker/time_picker_bottom_sheet.dart';

class DateTimePickerStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePickerStudy> {
  DateTime selectDate = DateTime.now();
  TimeOfDay selectTime = TimeOfDay.now();
  TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 16.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("DateTimePicker Study"),
       ),
       body: Column(
         children:[
           InkWell(
            onTap: () async {
               var result= await showDatePicker(
                context: context,
                initialDate: DateTime.now(), //默认日期    初始化时间，通常情况下设置为当前时间
                firstDate: DateTime(1990), //选择最早的日期范围    表示开始时间，设置后，选择器不能选择小于此值的时间
                lastDate: DateTime(2100), //最晚的日期范围     表示结束时间，设置后，选择器不能选择大于此值的时间
                builder: (BuildContext context, Widget child) {
                  return Theme(
                    data: ThemeData.dark(),
                    child: child,
                  );
                },
                initialDatePickerMode:DatePickerMode.year,  //datePicker 初始化显示的是那个页面，是day 页面还是year 页面
                textDirection:TextDirection.rtl,     //设置日期选择器的文本方向
                selectableDayPredicate: (dateTime) { //通过此方法可以过滤掉可选范围内不可选的特定日期
                  if(dateTime.day == 10 || dateTime.day == 20 || dateTime.day == 30) {
                    //此处表示10号、20号、30号不可选
                    return false;
                  }
                  return true;
                },
              );
               setState(() {
                  selectDate=result??DateTime.now();
               });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${formatDate(selectDate, [yyyy, '-', mm, '-', dd])}"),
                Icon(Icons.arrow_drop_down),
              ],
            ),
           ),
            InkWell(
              onTap: () async {
                  var result=await showTimePicker(
                                        context: context , 
                                        initialTime:TimeOfDay.now(),
                                        builder: (context, child) {
                                            return MediaQuery(
                                              data: MediaQuery.of(context)
                                                  .copyWith(alwaysUse24HourFormat: true),
                                              child: child,
                                            );
                                        },
                                  );
                  setState(() {
                     selectTime=result??TimeOfDay.now();
                  });                 
              },
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                    //Text("${formatDate(selectDate, [yyyy, '-', mm, '-', dd])}"),
                    Text("${selectTime.format(context)}"),
                    Icon(Icons.arrow_drop_down),
                 ],
              )
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("DatePicker Bottom Sheet", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DatePickerBottomSheet();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("DatePicker In Page", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DatePickerInPage();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("TimePicker Bottom Sheet", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TimePickerBottomSheet();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("TimePicker In Page", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TimePickerInPage();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("DateTimePicker Bottom Sheet", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DateTimePickerBottomSheet();
                }));
              },
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("DateTimePicker In Page", style: textStyle),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DateTimePickerInPage();
                }));
              },
            ),
         ]
       ),
    );
  }
}