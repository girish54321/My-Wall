import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/GetxControllers/HomeScreenGtx/CategoryTabGetx.dart';
import 'package:reqres_app/widget/imageList.dart';

class CategoryTabUI extends StatelessWidget {
  final CategoryTabController categoryTabController;
  const CategoryTabUI({Key? key, required this.categoryTabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TopicsList(
        topicList: categoryTabController.topicList.value,
        isLoading: categoryTabController.homeScreenLoading.value));
  }
}
