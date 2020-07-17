import 'package:flutter/material.dart';

class ValueNotifierModel {
  ValueNotifier<int> counter = ValueNotifier(0);
  Future<void> incrementCounter() async {
    await Future.delayed(Duration(seconds: 2));
    print(counter.value++);
    counter.value = counter.value;
  }
}
