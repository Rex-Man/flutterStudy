import 'package:flutterStudy/DialogStudy/dialogstudy_list.dart' as app;
import 'package:flutter_driver/driver_extension.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  app.DialogStudyList();
}