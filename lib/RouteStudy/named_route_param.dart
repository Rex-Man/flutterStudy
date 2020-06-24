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
               Navigator.of(context).pushNamed("/namedrouteparamresult",arguments: {"bodytext":'传递参数给result 页面'});
            },
          ),
      ),
    );
  }

}
class NamedRouteParamResult extends StatelessWidget {
  
  @override
  Widget build(Object context) {
    String text;
    dynamic  obj=ModalRoute.of(context).settings.arguments;
     if (obj != null && (obj["bodytext"]!=null||obj["bodytext"]!="")) {
      text = obj["bodytext"];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Named Route Param Result"),
      ),
      body: Container(child: Text("${text}")),
    );
  }
}