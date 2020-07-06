import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FractionSwiper extends StatelessWidget {
  List<String> images=[
    'assets/images/swiper1.jpg',
    'assets/images/swiper2.jpg',
    'assets/images/swiper3.jpg',
    'assets/images/swiper4.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("ExampleFraction"),
        ),
        body: new Column(
          children: <Widget>[
            Expanded(
                child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return new Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                          );
                        },
                        autoplay: true,
                        itemCount: images.length,
                        pagination:
                            new SwiperPagination(builder: SwiperPagination.fraction),
                        control: new SwiperControl(),
                  )
            ),
            Expanded(
                child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return  Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                          );
                        },
                        index:2,
                        autoplay: true,
                        itemCount: images.length,
                        scrollDirection: Axis.vertical,
                        pagination: new SwiperPagination(
                            alignment: Alignment.centerRight,
                            builder: SwiperPagination.fraction),
                      ))
          ],
        ));
  }
}