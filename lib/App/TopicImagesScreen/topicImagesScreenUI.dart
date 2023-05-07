import 'package:flutter/material.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenGtx/CategoryTabgGetx.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/widget/gradientAppBar.dart';
import 'package:reqres_app/widget/imageList.dart';

class TopicImagesScreenUI extends StatelessWidget {
  final Topics? topics;
  final CategoryTabController categoryTabController;
  const TopicImagesScreenUI(
      {Key? key, this.topics, required this.categoryTabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topics?.title ?? ""),
      ),
      // body: CustomScrollView(
      //   slivers: <Widget>[
      //     AppAppbar(
      //       title: topics?.title ?? "",
      //       imageUrl: topics?.coverPhoto?.urls?.small ?? "",
      //       subTitle: topics?.description ?? "",
      //       blurHash: topics?.coverPhoto?.blurHash ?? "",
      //       height: topics?.coverPhoto?.height ?? 1,
      //       width: topics?.coverPhoto?.width ?? 1,
      //     ),
      //     SliverPadding(
      //       padding: EdgeInsets.all(1),
      //       sliver: ImageList(
      //         imageList: categoryTabController.topicImages.value,
      //       ),
      //     )
      //   ],
      // ),
      body: ImageList(
        imageList: categoryTabController.topicImages.value,
      ),
    );
  }
}
