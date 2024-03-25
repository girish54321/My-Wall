import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/HomeTabGetx.dart';
import 'package:reqres_app/GetxControllers/settingsState.dart';
import 'package:reqres_app/widget/imageList.dart';

class HomeTabUI extends StatelessWidget {
  final HomeTabController homeTabController;
  final ScrollController scrollController;
  final SettingController settingController;

  const HomeTabUI(
      {Key? key,
      required this.homeTabController,
      required this.scrollController,
      required this.settingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => ImageList(
            isLoading: homeTabController.homeScreenLoading.value,
            imageList: homeTabController.homeScreenImage,
            perRow: settingController.perRow.value.round(),
            scrollController: scrollController,
          )),
    );
  }
}
