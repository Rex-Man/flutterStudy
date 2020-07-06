import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PhoneSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Phone"),
      ),
      body: new Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: new BoxConstraints.expand(),
            child: new Image.asset(
              "assets/images/swiper1.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Swiper.children(
            autoplay: false,
            pagination: new SwiperPagination(
                margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                builder: new DotSwiperPaginationBuilder(
                    color: Colors.white30,
                    activeColor: Colors.white,
                    size: 20.0,
                    activeSize: 20.0)),
            children: <Widget>[
              new Image.asset(
                "assets/images/swiper1.jpg",
                fit: BoxFit.contain,
              ),
              new Image.asset(
                "assets/images/swiper2.jpg",
                fit: BoxFit.contain,
              ),
              new Image.asset("assets/images/swiper3.jpg", fit: BoxFit.contain)
            ],
          )
        ],
      ),
    );
  }
}