import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reqres_app/GetxControllers/CategoryTabGetx.dart';
import 'package:reqres_app/App/HomeScreen/CategoryTab/CategoryTabUI.dart';
import 'package:reqres_app/GetxControllers/settingsState.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({Key? key}) : super(key: key);

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  @override
  Widget build(BuildContext context) {
    final CategoryTabController categoryTabController =
        Get.put(CategoryTabController());

    final SettingController settingController = Get.put(SettingController());
    return CategoryTabUI(
      categoryTabController: categoryTabController,
      settingController: settingController,
    );
  }
}
