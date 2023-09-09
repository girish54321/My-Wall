import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/GetxControllers/HomeScreenGtx/CategoryTabGetx.dart';
import 'package:reqres_app/app.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/widget/imageList.dart';

class TopicImageScreenUI extends StatelessWidget {
  final CategoryTabController homeTabController;
  final ScrollController scrollController;
  final Topics topics;

  const TopicImageScreenUI(
      {Key? key,
      required this.homeTabController,
      required this.scrollController,
      required this.topics})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topics.title ?? ""),
      ),
      body: Obx(
        (() => ImageList(
              isLoading: homeTabController.topicListLoading.value,
              imageList: homeTabController.topicImages,
              scrollController: scrollController,
            )),
      ),
    );
  }
}
