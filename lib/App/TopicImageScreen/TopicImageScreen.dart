import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/GetxControllers/HomeScreenGtx/CategoryTabGetx.dart';
import 'package:reqres_app/App/TopicImageScreen/TopicImageScreenUI.dart';
import 'package:reqres_app/network/dataModel/topic.dart';

class TopicImageScreen extends StatefulWidget {
  final Topics topics;
  const TopicImageScreen({Key? key, required this.topics}) : super(key: key);

  @override
  State<TopicImageScreen> createState() => _HomeTabState();
}

class _HomeTabState extends State<TopicImageScreen> {
  final CategoryTabController homeController = Get.put(CategoryTabController());
  final ScrollController _scrollController = ScrollController();

  void loadMoreImages() {
    homeController.getTopicsImages(widget.topics.id ?? "");
  }

  @override
  void initState() {
    loadMoreImages();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        loadMoreImages();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TopicImageScreenUI(
      homeTabController: homeController,
      scrollController: _scrollController,
      topics: widget.topics,
    );
  }

  @override
  void dispose() {
    homeController.clearTopicImages();
    _scrollController.dispose();
    super.dispose();
  }
}
