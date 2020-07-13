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
            title: Text("Sample QRCase"),
            subtitle: Text("Sample QRCase"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SampleQRFlutter()));
            }),
        ListTile(
            leading: Icon(Icons.account_balance),
            title: Text("Image QRCase"),
            subtitle: Text("Image QRCase"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ImageQRFlutter()));
            }),
        ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Exception QRCase"),
            subtitle: Text("Exception QRCase"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ExceptionQRFlutter()));
            }),
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

class ImageQRFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageQRFlutterState();
}

class _ImageQRFlutterState extends State<ImageQRFlutter> {
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
          embeddedImage: AssetImage('assets/images/head.jpg'),
          embeddedImageStyle: QrEmbeddedImageStyle(
            size: Size(80, 80),
          ),
        ),
      ),
    );
  }
}

class ExceptionQRFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExceptionQRFlutterState();
}

class _ExceptionQRFlutterState extends State<ExceptionQRFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generate QRCode"),
      ),
      body: Container(
        child: QrImage(
          data: 'This QR code will show the error state instead',
          version:
              QrVersions.auto, //http://www.qrcode.com/en/about/version.html .
          size: 320,
          gapless: false,
          errorStateBuilder: (cxt, err) {
            ///如果呈现QR代码时发生错误（例如：版本太低，输入太长等），则允许您显示错误状态Widget .
            return Container(
              child: Center(
                child: Text(
                  "Uh oh! Something went wrong...",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
