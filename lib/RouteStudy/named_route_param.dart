import 'package:flutter/material.dart';

class NamedRouteParam extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Named Router Param"),
      ),
      body: Container(
        child: RaisedButton(
            child: new Text('点我'),
            onPressed: () {
               Navigator.of(context).pushNamed("/namedrouteparamresult",arguments: {"bodytext":'Named Route Param Result Page'});
            },
          ),
      ),
    );
  }

}
class NamedRouteParamResult extends StatelessWidget {
  String text;
  @override
  Widget build(Object context) {
    dynamic  obj=ModalRoute.of(context).settings.arguments;
     if (obj != null && (obj["bodytext"]==null||obj["bodytext"]=="")) {
      text = obj["bodytext"];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Named Route Param Result"),
      ),
      body: Container(child: Text(text)),
    );
  }
}