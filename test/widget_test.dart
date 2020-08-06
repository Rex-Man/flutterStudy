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
    await tester.pumpWidget(MaterialApp(home: ButtonStudy(buttonkey: glkey)));
    //Finder iconFinder = find.byKey(glkey);
    Finder iconFinder = find.byIcon(Icons.search);
    await tester.tap(iconFinder);
    // Verify that our counter starts at 0.
    expect(iconFinder, findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    //await tester.tap(find.byIcon(Icons.account_box));
    await tester.pump();

    // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
