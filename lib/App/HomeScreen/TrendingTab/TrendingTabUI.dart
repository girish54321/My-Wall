import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/TandingTabGetx.dart';
import 'package:reqres_app/GetxControllers/settingsState.dart';
import 'package:reqres_app/widget/imageList.dart';

class TrendingTabUI extends StatelessWidget {
  final TendingTabController tendingTabController;
  final ScrollController scrollController;
  final SettingController settingController;
  const TrendingTabUI(
      {Key? key,
      required this.tendingTabController,
      required this.scrollController,
      required this.settingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => ImageList(
            imageList: tendingTabController.tendingImages,
            perRow: settingController.perRow.value.round(),
            scrollController: scrollController,
            isLoading: tendingTabController.homeScreenLoading.value,
          )),
    );
  }
}
