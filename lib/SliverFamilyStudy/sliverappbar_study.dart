import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  var _key = GlobalKey<SliverAnimatedListState>();
  List<String> imagesHead = [
    for (var i = 1; i < 11; i++) "assets/images/tou$i.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //设置为true时，当手指放开时，SliverAppBar会根据当前的位置进行调整，始终保持展开或收起的状态，此效果在floating=true时生效
          snap: true,
          //设置为true时，当SliverAppBar内容滑出屏幕时，将始终渲染一个固定在顶部的收起状态 false 时，appbar 会隐藏掉。
          pinned: true,
          //设置为true时，向下滑动时，即使当前CustomScrollView不在顶部，SliverAppBar也会跟着一起向下出现
          floating: true,
          expandedHeight: 200.0, //展开区域的高度
          title: Text('复仇者联盟1'),
          flexibleSpace: FlexibleSpaceBar(
            //展开和折叠区域
            title: Text('复仇者联盟'),
            background: Image.network(
              'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 80.0,
          //SliverChildBuilderDelegate构建的列表理论上是可以无限长的，因为使用来lazily construct优化
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  //padding: const EdgeInsets.all(20),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Image.asset(imagesHead[index % 10]),
                      Column(
                        children: <Widget>[
                          Text(
                            "Title first",
                            style: TextStyle(fontSize: 5),
                          ),
                          Text(
                            "Title second",
                            style: TextStyle(fontSize: 5),
                          ),
                        ],
                      )
                    ],
                  ));
            },
          ),

          // SliverChildListDelegate一般用来构item建数量明确的列表，会提前build好所有的子item，所以在效率上会有问题，适合item数量不多的情况
          // delegate: SliverChildListDelegate(
          //   imagesHead.map((product) {
          //     return Container(
          //         margin: const EdgeInsets.only(top: 20),
          //         width: MediaQuery.of(context).size.width,
          //         //padding: const EdgeInsets.all(20),
          //         color: Colors.white,
          //         child: Row(
          //           children: <Widget>[
          //             Image.asset(product),
          //             Column(
          //               children: <Widget>[
          //                 Text(
          //                   "Title first",
          //                   style: TextStyle(fontSize: 5),
          //                 ),
          //                 Text(
          //                   "Title second",
          //                   style: TextStyle(fontSize: 5),
          //                 ),
          //               ],
          //             )
          //           ],
          //         ));
          //   }).toList(),
          // ),
        ),
      ],
    );
  }
}
