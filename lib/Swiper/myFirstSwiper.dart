import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyFirstSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Swiper Show"),
        ),
        body: MainHomePage());
  }
}

class MainHomePage extends StatelessWidget {
  final List<String> images = [
    'assets/images/pic1.jpg',
    'assets/images/pic2.jpg',
    'assets/images/pic3.jpg',
    'assets/images/pic4.jpg'
  ];

  final List<Widget> widgetButtonWrap = [ButtonWrap(), ButtonWrap()];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
            child: Container(
              width: double.infinity,
              height: 200.0,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    images[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: images.length,
                pagination: SwiperPagination(builder: SwiperPagination.dots),
                //control: SwiperControl(),
              ),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
            child: Container(
              width: double.infinity,
              height: 200.0,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return widgetButtonWrap[index];
                },
                loop: false,
                itemCount: 2,
                pagination: SwiperPagination(builder: SwiperPagination.dots),
                //control: SwiperControl(),
              ),
            ))
      ],
    );
  }
}

class ButtonWrap extends StatelessWidget {
  List<String> imagesHead = [
    for (var i = 1; i < 11; i++) "assets/images/tou$i.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        children: imagesHead
            .map<Widget>(
              (imageHeadPic) => GestureDetector(
                onTap: () {
                  Fluttertoast.showToast(msg: "Click first picture");
                },
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        imageHeadPic,
                        fit: BoxFit.fill,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("京东超市"),
                  ],
                ),
              ),
            )
            .toList());
  }
}

class ButtonWrapShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20.0,
      runSpacing: 20.0,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click first picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou1.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click 2 picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou2.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click 3 picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou3.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click 4 picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou4.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click 5 picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou5.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click 6 picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou6.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click 7 picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou7.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click 8 picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou8.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click 9 picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou9.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Fluttertoast.showToast(msg: "Click 10 picture");
          },
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  "assets/images/tou10.jpg",
                  fit: BoxFit.fill,
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("京东超市"),
            ],
          ),
        ),
      ],
    );
  }
}
