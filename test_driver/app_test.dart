// Imports the Flutter Driver API
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('dialogstudy integration test', () {
    FlutterDriver driver;
    setUpAll(() async {
      // 这个方法是在最开始call的，只call一次 group 内
      print("setUpAll function called");
      // 连接app
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      //所有方法都call完了，最后执行的方法
      if (driver != null) {
        // 关闭连接
        driver.close();
      }
      print("tearDownall function called");
    });
    tearDown(() async {
      // 每个test法方法运行结束后都会调用
      print("tearDown function called");
    });
    setUp(() {
      // 每个test方法运行之前都会执行。
      print("Set up function called");
    });
    test("description", () async {
      //SerializableFinder finder = find.byType("Column");

      SerializableFinder finder = find.text('Simple Dialog');
      await driver.tap(finder);
      await driver.tap(find.byValueKey('alertdialog'));
    });
    test("description1", () async {
      //SerializableFinder finder = find.byType("Column");

      SerializableFinder finder = find.text('Simple Dialog');

      find.byValueKey('alertdialog');
    });
  });
}
