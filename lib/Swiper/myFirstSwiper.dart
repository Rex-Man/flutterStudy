import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyFirstSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Swiper Show"),
        ),
        body: LoadingCaseForList());
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
              height: 230.0,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return widgetButtonWrap[index];
                },
                loop: false,
                itemCount: 2,
                pagination: SwiperPagination(builder: SwiperPagination.dots),
                //control: SwiperControl(),
              ),
            )),
      ],
    );
  }
}

/// 这个是将图片循环加载拼装
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

class LoadingCaseForList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingCaseForListState();
  }
}

class _LoadingCaseForListState extends State<LoadingCaseForList> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final List<String> images = [
    'https://img12.360buyimg.com/mobilecms/s372x372_jfs/t1/141737/18/2293/301136/5f030488Ecd675dac/72a6bf1f1bbfd20e.jpg!q70.dpg.webp',
    'https://img10.360buyimg.com/mobilecms/s372x372_jfs/t1/33812/12/14323/228178/5d0c89beE2bb012b3/7887b6e272cfcfa1.jpg!q70.dpg.webp',
    'https://img13.360buyimg.com/mobilecms/s372x372_jfs/t1/109708/2/18638/228428/5ec4d0ccEe8c4ed40/b85e74f17821f7c1.jpg!q70.dpg.webp',
    'https://img13.360buyimg.com/mobilecms/s372x372_jfs/t1/131837/28/3775/482675/5f02cdf3Eb12e3e29/b84d51bb9dc19030.png.webp'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      header: WaterDropHeader(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: MainHomePage(),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ListTile(
                  leading: Image.network(images[index]),
                  title: Text("Sample Swiper"),
                  subtitle: Text("简单轮播图的例子"),
                  trailing: new Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.pushNamed(context, "/swiperSample");
                  });
            }, childCount: images.length),
          )
        ],
      ),
      onRefresh: () async {
        //monitor fetch data from network
        await Future.delayed(Duration(milliseconds: 1000));

        for (int i = 0; i < 4; i++) {
          images.add(
              "https://img13.360buyimg.com/mobilecms/s372x372_jfs/t1/129292/16/1879/507301/5ec0f220E9c21bc01/29d197ce78c362cd.jpg!q70.dpg.webp");
        }

        if (mounted) setState(() {});
        _refreshController.refreshCompleted();
      },
      onLoading: () async {
        //monitor fetch data from network
        await Future.delayed(Duration(milliseconds: 1000));
        for (int i = 0; i < 4; i++) {
          images.add(
              "https://img13.360buyimg.com/mobilecms/s372x372_jfs/t1/83687/13/2377/198636/5d0b566eE5d7e487c/72e2fbab0fcdde24.jpg!q70.dpg.webp");
        }

        if (mounted) setState(() {});
        _refreshController.loadComplete();
      },
    ));
  }
}
