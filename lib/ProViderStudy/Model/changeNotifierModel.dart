import 'package:flutter/material.dart';

class ChangeNotifierModel with ChangeNotifier {
  //                                               <--- MyModel
  ChangeNotifierModel({this.counter = 0});

  int counter = 0;

  Future<void> incrementCounter() async {
    await Future.delayed(Duration(seconds: 2));
    counter++;
    print(counter);
    notifyListeners();
  }
}
