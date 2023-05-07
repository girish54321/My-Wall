import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenGtx/CategoryTabgGetx.dart';
import 'package:reqres_app/App/TopicImagesScreen/TopicImagesScreenUI.dart';
import 'package:reqres_app/network/dataModel/topic.dart';

class TopicImagesScreen extends StatefulWidget {
  final Topics? topics;

  const TopicImagesScreen({Key? key, required this.topics}) : super(key: key);
  @override
  _TopicImagesScreenState createState() => _TopicImagesScreenState();
}

class _TopicImagesScreenState extends State<TopicImagesScreen> {
  final CategoryTabController categoryTabController =
      Get.put(CategoryTabController());

  @override
  void initState() {
    super.initState();
    categoryTabController.getTopicsImages(widget.topics?.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return TopicImagesScreenUI(
      topics: widget.topics,
      categoryTabController: categoryTabController,
    );
  }
}
