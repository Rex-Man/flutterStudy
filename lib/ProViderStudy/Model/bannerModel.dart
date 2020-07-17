import 'package:flutter/material.dart';

class BannerModel with ChangeNotifier {
  int counter = 0;

  Future<void> getBanner() async {
    await Future.delayed(Duration(seconds: 2));
    counter++;
    notifyListeners();
    print(counter);
  }
}
