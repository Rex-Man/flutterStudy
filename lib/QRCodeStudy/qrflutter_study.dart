import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRFlutterStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QRFlutter Study List"),
      ),
      body: ListView(children: [
        ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("Webview Sample"),
            subtitle: Text("简单webview的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SampleQRFlutter()));
            }),
        // ListTile(
        //     leading: Icon(Icons.ac_unit),
        //     title: Text("Webview Other"),
        //     subtitle: Text("简单webview的例子"),
        //     trailing: new Icon(Icons.keyboard_arrow_right),
        //     onTap: () {
        //       Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) => OtherWebView()));
        //     }),
        // ListTile(
        //     leading: Icon(Icons.access_alarms),
        //     title: Text("Webview MyHomePage"),
        //     subtitle: Text("简单webview的例子"),
        //     trailing: new Icon(Icons.keyboard_arrow_right),
        //     onTap: () {
        //       Navigator.of(context)
        //           .push(MaterialPageRoute(builder: (context) => MyHomePage()));
        //     }),
      ]),
    );
  }
}

class SampleQRFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SampleQRFluterState();
}

class _SampleQRFluterState extends State<SampleQRFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QRCode"),
      ),
      body: Container(
        child: QrImage(
          data: 'This is a simple QR code',
          version: QrVersions.auto,
          size: 320,
          gapless: false,
        ),
      ),
    );
  }
}
