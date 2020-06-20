import 'package:flutter/material.dart';

class NamedRouteReturn extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Named Route Back"),
      ),
      body: Container(
          child: Column(
            children: [
                RaisedButton(
                  child: Text("第一种传递值的方式"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new NamedRouteReturnResult()),
                    ).then((data) {
                      //接受返回的参
                      print(data.toString());
                    });
                  }
                ),
                RaisedButton(
                  child:Text("第二种传递值的方式"),
                  onPressed: (){
                   _navigateAndDisplaySelection(context);
                  }
                )
      ])),
    );
  }
  _navigateAndDisplaySelection(BuildContext context) async{
    final result =await Navigator.push(context, 
       MaterialPageRoute(builder: (context)=> NamedRouteReturnResult())
    );
    print(result.toString());  
  }
}

class NamedRouteReturnResult extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Return Value Back"),
      ),
      body: Container(
          child: RaisedButton(
              child: Text("click me"),
              onPressed: () {
                Navigator.of(context).pop('这个是要返回给上一个页面的数据');
              })),
    );
  }
}


