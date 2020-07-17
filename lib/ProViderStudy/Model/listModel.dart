import 'package:flutter/material.dart';

class ListModel with ChangeNotifier {
  int counter = 0;

  Future<void> getList() async {
    await Future.delayed(Duration(seconds: 2));
    counter++;
    notifyListeners();
    print(counter);
  }
}
