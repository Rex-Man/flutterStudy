

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DateTimePickerStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePickerStudy> {
  DateTime selectDate = DateTime.now();
  TimeOfDay selectTime = TimeOfDay.now();
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
            
         ]
       ),
    );
  }
}