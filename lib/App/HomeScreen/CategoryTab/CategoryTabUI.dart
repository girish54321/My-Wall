import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/CategoryTabGetx.dart';
import 'package:reqres_app/GetxControllers/settingsState.dart';
import 'package:reqres_app/widget/imageList.dart';

class CategoryTabUI extends StatelessWidget {
  final CategoryTabController categoryTabController;
  final SettingController settingController;
  const CategoryTabUI(
      {Key? key,
      required this.categoryTabController,
      required this.settingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TopicsList(
          perRow: settingController.perRow.value.round(),
          topicList: categoryTabController.topicList,
          isLoading: categoryTabController.homeScreenLoading.value,
          goto: null,
        ));
  }
}
