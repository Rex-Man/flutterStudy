import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class SampleSwiperStudy  extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SampleSwiperStudy> {
  List<String> imageListUrl= [
    'http://pic.uuhy.com/uploads/2013/08/06/parodies-3d-minions-36.jpg',
    'http://pic.uuhy.com/uploads/2013/08/06/parodies-3d-minions-38.jpg',
    'http://pic.uuhy.com/uploads/2013/08/06/parodies-3d-minions-35.jpg'

  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample Swiper"),
      ),
    body:  new Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network(imageListUrl[index],fit: BoxFit.fill,);
        },
        scrollDirection:Axis.vertical,  //滚动方向，设置为Axis.vertical如果需要垂直滚动
        loop:true,      //无限轮播模式开关
        duration:300,  //动画时间，单位是毫秒
        autoplay:true, //自动播放开关.
        itemCount: 3,
        //index:1,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      ),
    );
  }
}