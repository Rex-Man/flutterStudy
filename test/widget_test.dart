// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutterStudy/ButtonStudy/button_study.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Found ButtonStudy Page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Key glkey = Key("studybutton");
    //tester.pumpWidget 这个方法相当于无页面加载ui树。
    // 这里面如果需要用key 的方法来定位元素并获得元素，就要在初始化的时候将这个key 传递进去，然后在外面可以得到他。
    //Finder iconFinder = find.byKey(glkey);

    await tester.pumpWidget(MaterialApp(home: ButtonStudy(buttonkey: glkey)));
    Finder iconFinder = find.byIcon(Icons.search);
    await tester.tap(iconFinder);
    // Verify that our counter starts at 0.
    expect(iconFinder, findsOneWidget);

    await tester.pump();
  });
}
