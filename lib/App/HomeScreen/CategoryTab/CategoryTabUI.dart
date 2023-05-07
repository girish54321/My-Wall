import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/HomeScreen/HomeScreenGtx/CategoryTabgGetx.dart';
import 'package:reqres_app/widget/imageList.dart';

class CategoryTabUI extends StatelessWidget {
  final CategoryTabController categoryTabController;
  const CategoryTabUI({Key? key, required this.categoryTabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => categoryTabController.homeScreenLoading.value
          ? const Center(child: CircularProgressIndicator())
          : categoryTabController.topicList.value.isEmpty
              ? const Text("Noting Here")
              : TopicsList(
                  topicList: categoryTabController.topicList.value,
                )),
    );
  }
}
