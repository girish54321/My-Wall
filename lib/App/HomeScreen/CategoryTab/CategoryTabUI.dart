import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/CategoryTabGetx.dart';
import 'package:reqres_app/widget/imageList.dart';

class CategoryTabUI extends StatelessWidget {
  final CategoryTabController categoryTabController;
  const CategoryTabUI({Key? key, required this.categoryTabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TopicsList(
        topicList: categoryTabController.topicList,
        isLoading: categoryTabController.homeScreenLoading.value));
  }
}
