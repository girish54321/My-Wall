import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/GratingsTabController.dart';
import 'package:reqres_app/GetxControllers/settingsState.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/widget/imageList.dart';

class GratingsTabUI extends StatelessWidget {
  final GratingsTabController gratingsTabController;
  final SettingController settingController;
  final Function(Topics? fff)? onTap;
  const GratingsTabUI(
      {Key? key,
      required this.gratingsTabController,
      this.onTap,
      required this.settingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TopicsList(
          topicList: gratingsTabController.topicList,
          perRow: settingController.perRow.value.round(),
          isLoading: gratingsTabController.homeScreenLoading.value,
          goto: onTap,
        ));
  }
}
