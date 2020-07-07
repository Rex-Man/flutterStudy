import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:loading_more_list/loading_more_list.dart';

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
            )),
            
      ],
    );
  }
}
///
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

// class WaterfallFlowDemo extends StatefulWidget {
//   @override
//   _WaterfallFlowDemoState createState() => _WaterfallFlowDemoState();
// }

// class _WaterfallFlowDemoState extends State<WaterfallFlowDemo> {
//   TuChongRepository listSourceRepository;
//   @override
//   void initState() {
//     listSourceRepository = TuChongRepository();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     listSourceRepository?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Column(
//         children: <Widget>[
//           AppBar(
//             title: const Text('WaterfallFlowDemo'),
//           ),
//           Expanded(
//             child: LayoutBuilder(builder: (BuildContext c, BoxConstraints data) {
//               final int crossAxisCount = max(
//                   data.maxWidth ~/ (ScreenUtil.instance.screenWidthDp / 2.0),
//                   2);
//               return LoadingMoreList<TuChongItem>(
//                 ListConfig<TuChongItem>(
//                   extendedListDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: crossAxisCount,
//                     crossAxisSpacing: 5,
//                     mainAxisSpacing: 5,
//                   ),
//                   itemBuilder: buildWaterfallFlowItem,
//                   sourceList: listSourceRepository,
//                   padding: const EdgeInsets.all(5.0),
//                   lastChildLayoutType: LastChildLayoutType.foot,
//                 ),
//               );
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }
// class TuChongRepository extends LoadingMoreBase<TuChongItem> {
//   int pageindex = 1;
//   bool _hasMore = true;
//   bool forceRefresh = false;
//   @override
//   bool get hasMore => (_hasMore && length < 30) || forceRefresh;

//   @override
//   Future<bool> refresh([bool clearBeforeRequest = false]) async {
//     _hasMore = true;
//     pageindex = 1;
//     //force to refresh list when you don't want clear list before request
//     //for the case, if your list already has 20 items.
//     forceRefresh = !clearBeforeRequest;
//     var result = await super.refresh(clearBeforeRequest);
//     forceRefresh = false;
//     return result;
//   }

//   @override
//   Future<bool> loadData([bool isloadMoreAction = false]) async {
//     String url = "";
//     if (this.length == 0) {
//       url = "https://api.tuchong.com/feed-app";
//     } else {
//       int lastPostId = this[this.length - 1].postId;
//       url =
//           "https://api.tuchong.com/feed-app?post_id=$lastPostId&page=$pageindex&type=loadmore";
//     }
//     bool isSuccess = false;
//     try {
//       //to show loading more clearly, in your app,remove this
//       await Future.delayed(Duration(milliseconds: 500));

//       var result = await HttpClientHelper.get(url);

//       var source = TuChongSource.fromJson(json.decode(result.body));
//       if (pageindex == 1) {
//         this.clear();
//       }
//       for (var item in source.feedList) {
//         if (item.hasImage && !this.contains(item) && hasMore) this.add(item);
//       }

//       _hasMore = source.feedList.length != 0;
//       pageindex++;
//       isSuccess = true;
//     } catch (exception, stack) {
//       isSuccess = false;
//       print(exception);
//       print(stack);
//     }
//     return isSuccess;
//   }
// }