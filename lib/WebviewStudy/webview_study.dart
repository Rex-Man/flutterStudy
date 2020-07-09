import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview Study List"),
      ),
      body: ListView(children: [
        ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("Webview Sample"),
            subtitle: Text("简单webview的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SampleWebView()));
            }),
        ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text("Webview Other"),
            subtitle: Text("简单webview的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => OtherWebView()));
            }),
        ListTile(
            leading: Icon(Icons.access_alarms),
            title: Text("Webview MyHomePage"),
            subtitle: Text("简单webview的例子"),
            trailing: new Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyHomePage()));
            }),
      ]),
    );
  }
}

class SampleWebView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SampleWebViewState();
}

class _SampleWebViewState extends State<SampleWebView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: WebviewScaffold(
      url: "https://www.baidu.com",
      appBar: new AppBar(
        title: const Text('Widget webview'),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.redAccent,
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    ));
  }
}

class OtherWebView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OtherWebViewState();
}

class _OtherWebViewState extends State<OtherWebView> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebviewScaffold(
      //要打开的网址
      url: "https://www.baidu.com",
      appBar: new AppBar(
        title: new Text("flutter_webview_plugin的使用"),
      ),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedUrl = 'https://www.baidu.com';
  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  // On destroy stream
  StreamSubscription _onDestroy;

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;

  // On urlChanged stream
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  StreamSubscription<WebViewHttpError> _onHttpError;

  StreamSubscription<double> _onProgressChanged;

  StreamSubscription<double> _onScrollYChanged;

  StreamSubscription<double> _onScrollXChanged;

  final _urlCtrl = TextEditingController(text: "https://www.baidu.com");

  final _codeCtrl = TextEditingController(text: 'window.navigator.userAgent');

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _history = [];

  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.close();

    _urlCtrl.addListener(() {
      selectedUrl = _urlCtrl.text;
    });

    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebViewPlugin.onDestroy.listen((_) {
      if (mounted) {
        // Actions like show a info toast.
        _scaffoldKey.currentState.showSnackBar(
            const SnackBar(content: const Text('Webview Destroyed')));
      }
    });

    // Add a listener to on url changed
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          _history.add('onUrlChanged: $url');
        });
      }
    });

    _onProgressChanged =
        flutterWebViewPlugin.onProgressChanged.listen((double progress) {
      if (mounted) {
        setState(() {
          _history.add('onProgressChanged: $progress');
        });
      }
    });

    _onScrollYChanged =
        flutterWebViewPlugin.onScrollYChanged.listen((double y) {
      if (mounted) {
        setState(() {
          _history.add('Scroll in Y Direction: $y');
        });
      }
    });

    _onScrollXChanged =
        flutterWebViewPlugin.onScrollXChanged.listen((double x) {
      if (mounted) {
        setState(() {
          _history.add('Scroll in X Direction: $x');
        });
      }
    });

    _onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        setState(() {
          _history.add('onStateChanged: ${state.type} ${state.url}');
        });
      }
    });

    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
      if (mounted) {
        setState(() {
          _history.add('onHttpError: ${error.code} ${error.url}');
        });
      }
    });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    _onProgressChanged.cancel();
    _onScrollXChanged.cancel();
    _onScrollYChanged.cancel();

    flutterWebViewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const kAndroidUserAgent =
        'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              child: TextField(controller: _urlCtrl),
            ),
            RaisedButton(
              onPressed: () {
                flutterWebViewPlugin.launch(
                  selectedUrl,
                  rect: Rect.fromLTWH(
                      0.0, 0.0, MediaQuery.of(context).size.width, 300.0),
                  userAgent: kAndroidUserAgent,
                  invalidUrlRegex:
                      r'^(https).+(twitter)', // prevent redirecting to twitter when user click on its icon in flutter website
                );
              },
              child: const Text('Open Webview (rect)'),
            ),
            RaisedButton(
              onPressed: () {
                flutterWebViewPlugin.launch(selectedUrl, hidden: true);
              },
              child: const Text('Open "hidden" Webview'),
            ),
            RaisedButton(
              onPressed: () {
                flutterWebViewPlugin.launch(selectedUrl);
              },
              child: const Text('Open Fullscreen Webview'),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: TextField(controller: _codeCtrl),
            ),
            RaisedButton(
              onPressed: () {
                final future =
                    flutterWebViewPlugin.evalJavascript(_codeCtrl.text);
                future.then((String result) {
                  setState(() {
                    _history.add('eval: $result');
                  });
                });
              },
              child: const Text('Eval some javascript'),
            ),
            RaisedButton(
              onPressed: () {
                final future = flutterWebViewPlugin
                    .evalJavascript('alert("Hello World");');
                future.then((String result) {
                  setState(() {
                    _history.add('eval: $result');
                  });
                });
              },
              child: const Text('Eval javascript alert()'),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _history.clear();
                });
                flutterWebViewPlugin.close();
              },
              child: const Text('Close'),
            ),
            RaisedButton(
              onPressed: () {
                flutterWebViewPlugin.getCookies().then((m) {
                  setState(() {
                    _history.add('cookies: $m');
                  });
                });
              },
              child: const Text('Cookies'),
            ),
            Text(_history.join('\n'))
          ],
        ),
      ),
    );
  }
}
