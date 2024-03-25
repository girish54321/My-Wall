import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/App/HomeScreen/GretingsTab/GretingsTabUI.dart';
import 'package:reqres_app/App/SearchSceen/searchedImagePage.dart';
import 'package:reqres_app/GetxControllers/GratingsTabController.dart';
import 'package:reqres_app/GetxControllers/settingsState.dart';
import 'package:reqres_app/network/dataModel/topic.dart';
import 'package:reqres_app/network/util/helper.dart';

class GratingsTab extends StatefulWidget {
  const GratingsTab({Key? key}) : super(key: key);

  @override
  State<GratingsTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<GratingsTab> {
  @override
  Widget build(BuildContext context) {
    final GratingsTabController gratingsTabController =
        Get.put(GratingsTabController());

    final SettingController settingController = Get.put(SettingController());

    void onTap(Topics? topics) {
      Helper().goToPage(
          context: context,
          child: SearchedImagePage(
            autoFileSearch: topics?.title,
          ));
    }

    return GratingsTabUI(
      gratingsTabController: gratingsTabController,
      settingController: settingController,
      onTap: onTap,
    );
  }
}
